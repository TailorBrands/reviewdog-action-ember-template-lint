FROM node:16-alpine3.11

ARG REVIEWDOG_VERSION=0.13.0
ARG REVIEWDOG_SHA256=2993478234218448d66fa34c275f8821fbdf99d8d63b7fa6ff3e6352f9e85df2
RUN wget -q https://github.com/reviewdog/reviewdog/releases/download/v${REVIEWDOG_VERSION}/reviewdog_${REVIEWDOG_VERSION}_Linux_x86_64.tar.gz \
  && echo "${REVIEWDOG_SHA256}  reviewdog_${REVIEWDOG_VERSION}_Linux_x86_64.tar.gz" | sha256sum -c - \
  && tar -C /usr/local/bin -xzf reviewdog_${REVIEWDOG_VERSION}_Linux_x86_64.tar.gz reviewdog \
  && rm reviewdog_${REVIEWDOG_VERSION}_Linux_x86_64.tar.gz

RUN apk --no-cache add jq git

COPY entrypoint.sh /entrypoint.sh
COPY ember-template-lint-formatter-rdjson/index.js /formatter.js

ENTRYPOINT ["/entrypoint.sh"]
