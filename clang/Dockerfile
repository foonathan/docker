ARG DEBIAN_VERSION
FROM bitnami/minideb:${DEBIAN_VERSION}
LABEL maintainer="Jonathan Müller <jonathanmueller.dev@gmail.com>"

WORKDIR /root
COPY install-llvm.sh install-cmake.sh ./

ARG LLVM_VERSION
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends ca-certificates ninja-build git g++ wget xz-utils && \
    ./install-llvm.sh $LLVM_VERSION && \
    ./install-cmake.sh && \
    rm install-llvm.sh install-cmake.sh

ENV CC  clang
ENV CXX clang++

