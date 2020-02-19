FROM ruby:2.7-alpine

LABEL "com.github.actions.name"="PR Comment"
LABEL "com.github.actions.description"="Leaves a comment on an open PR based on the contents of a file."
LABEL "com.github.actions.repository"="https://github.com/machine-learning-apps/comment-on-pr"
LABEL "com.github.actions.maintainer"="Alexander Matheson <awmatheson@github.com>"
LABEL "com.github.actions.icon"="message-square"
LABEL "com.github.actions.color"="black"

RUN gem install octokit

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]