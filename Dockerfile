# Alpine Docker image version
ARG ALPINE_VERSION="20250108"

FROM alpine:${ALPINE_VERSION}

# Set an environment variable for the output filename.
# It's empty by default, so our script will use the standard LaTeX behavior.
ENV OUTPUT_FILENAME=""

# Installing packages
# hadolint ignore=DL3018
RUN apk update && \
    apk add --no-cache \
        texlive-full && \
    rm -rf /var/cache/apk/

# Copy and set up the entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# 'xelatex' user
RUN addgroup -S xelatex && adduser -S -G xelatex xelatex
USER xelatex
WORKDIR /home/xelatex/project

# Set the entrypoint to our custom script
ENTRYPOINT [ "entrypoint.sh" ]
