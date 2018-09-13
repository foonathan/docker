FROM alpine:edge

LABEL maintainer="Jonathan Müller <jonathanmueller.dev@gmail.com>"

# setup APK
RUN apk update && apk upgrade \
    && apk add ca-certificates \
    && rm -rf /var/cache/apk/* \
# install core tools
    && apk add libc-dev gcc make \
# install bash for convenience
   && apk add bash \
# install git to fetch submodules
   && apk add git \
# install buildsystem
   && apk add cmake

# setup working directory
WORKDIR /root

