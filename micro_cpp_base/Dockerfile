FROM alpine:edge

LABEL maintainer="Jonathan Müller <jonathanmueller.dev@gmail.com>"

# setup APK
RUN apk update && apk upgrade \
    && apk add --no-cache ca-certificates \
    && rm -rf /var/cache/apk/* \
# install core tools
    && apk add --no-cache libc-dev gcc make \
# install bash for convenience
   && apk add --no-cache bash \
# install git to fetch submodules
   && apk add --no-cache git \
# install buildsystem
   && apk add --no-cache cmake

# setup working directory
WORKDIR /root

