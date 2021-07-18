# Alpine Docker image version
ARG ALPINE_VERSION="20201218"

FROM alpine:${ALPINE_VERSION}

# Installing packages
# hadolint ignore=DL3018
RUN apk update && \
    apk add --no-cache \
        texlive-full && \
    rm -rf /var/cache/apk/

# 'xelatex' user
RUN addgroup -S xelatex && adduser -S -G xelatex xelatex
USER xelatex
WORKDIR /home/xelatex/project

ENTRYPOINT [ "xelatex" ]
