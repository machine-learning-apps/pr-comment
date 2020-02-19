# PR Comment Action

A GitHub action that will comment on the relevant open PR with a file contents when a commit is pushed.

## Usage

- Requires the `GITHUB_TOKEN` secret.
- Requires the comment's artifact in the `msg` parameter.
- Supports `push` and `pull_request` event types.

### Sample workflow

```
name: pr-comment example
on: pull_request
jobs:
  example:
    name: sample comment
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v1
      - run: mkdir -p path/to/artifact
      - run: echo hello > path/to/artifact/world.txt
      - uses: actions/upload-artifact@v1
        with:
          name: my-artifact
          path: path/to/artifact

      - uses: actions/download-artifact@v1
        with:
          name: my-artifact
          path: path/to/artifact
          
- run: cat path/to/artifact
      - name: comment PR
        uses: machine-learning-apps/pr-comment@master
        env:
          GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
        with:
          msg: "Check out this message!"
```
