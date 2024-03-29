FROM node:16-alpine3.11

ENV REVIEWDOG_VERSION=v0.13.0

RUN wget -O - -q https://raw.githubusercontent.com/reviewdog/reviewdog/master/install.sh| sh -s -- -b /usr/local/bin/ ${REVIEWDOG_VERSION}

RUN apk --no-cache add jq git

COPY entrypoint.sh /entrypoint.sh
COPY ember-template-lint-formatter-rdjson/index.js /formatter.js

ENTRYPOINT ["/entrypoint.sh"]
