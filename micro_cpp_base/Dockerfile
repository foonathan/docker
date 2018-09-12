FROM alpine:edge

LABEL maintainer="Jonathan Müller <jonathanmueller.dev@gmail.com>"

# setup APK
RUN apk update && apk upgrade \
    && apk add ca-certificates \
    && rm -rf /var/cache/apk/*

# install core tools
RUN apk add libc-dev gcc make
# install bash for convenience
RUN apk add bash
# install git to fetch submodules
RUN apk add git

# install buildsystem
RUN apk add cmake

# setup working directory
WORKDIR /root

