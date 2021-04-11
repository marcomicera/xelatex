# Alpine Docker image version
ARG ALPINE_VERSION="20201218"

FROM alpine:${ALPINE_VERSION}

# Installing packages
RUN apk update && \
    apk add --no-cache \
        texlive-full=20200406-r10 && \
    rm -rf /var/cache/apk/

# 'xelatex' user
RUN addgroup -S xelatex && adduser -S -G xelatex xelatex
USER xelatex
WORKDIR /home/xelatex/project

ENTRYPOINT [ "xelatex" ]
