# Base image.
FROM debian:latest
LABEL maintainer="Jonathan Müller <jonathanmueller.dev@gmail.com>"

ARG LLVM_VERSION

WORKDIR /root
COPY install.sh .

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends ca-certificates cmake ninja-build git g++ wget xz-utils && \
    ./install.sh $LLVM_VERSION && \
    rm install.sh

ENV CC  clang
ENV CXX clang++

