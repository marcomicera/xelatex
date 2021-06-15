# Alpine Docker image version
ARG ALPINE_VERSION="20201218"

# `texlive-full` apk version
ARG TEXLIVE_FULL_VERSION="20210325-r2"

FROM alpine:${ALPINE_VERSION}

# Installing packages
ARG TEXLIVE_FULL_VERSION
RUN apk update && \
    apk add --no-cache \
        texlive-full="${TEXLIVE_FULL_VERSION}" && \
    rm -rf /var/cache/apk/

# 'xelatex' user
RUN addgroup -S xelatex && adduser -S -G xelatex xelatex
USER xelatex
WORKDIR /home/xelatex/project

ENTRYPOINT [ "xelatex" ]
