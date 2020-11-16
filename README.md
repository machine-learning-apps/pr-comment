# PR Comment and Update Action

A GitHub action that will comment on the relevant open PR with a file contents when a commit is pushed. If the action has already commented on the PR, an update to the previous comment will be made instead.

Based off of [PR Comment Action](https://github.com/machine-learning-apps/pr-comment) by Alexander Matheson.

## Usage

- Requires the `GITHUB_TOKEN` secret.
- Requires the comment's artifact in the `msg` parameter.
- Requires a comment prefix in the `prefix` parameter. Comments with the prefix will be subsequently updated if the action is run again.
- Supports `push` and `pull_request` event types.

### Sample workflow

```
  
name: example
on: pull_request
jobs:
  example:
    name: example
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - run: mkdir -p output/
      - run: echo "This is fancy a comment" > output/results.txt
      - uses: actions/upload-artifact@v1
        with:
          name: results
          path: output
      - uses: actions/download-artifact@v1
        with:
          name: results
      - name: comment PR
        uses: machine-learning-apps/pr-comment@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          path: results/results.txt
          prefix: Benchmark Results
```
