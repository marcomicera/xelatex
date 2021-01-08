# Alpine Docker image version
ARG ALPINE_VERSION="20201218"

FROM alpine:${ALPINE_VERSION}

RUN apk update && \
    apk add \
    texlive-full=20190410-r13

# 'xelatex' user
RUN addgroup -S xelatex && adduser -S -G xelatex xelatex
USER xelatex
WORKDIR /home/xelatex/project

ENTRYPOINT [ "xelatex" ]
