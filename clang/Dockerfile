ARG DEBIAN_VERSION
FROM bitnami/minideb:${DEBIAN_VERSION}
LABEL maintainer="Jonathan Müller <jonathanmueller.dev@gmail.com>"

WORKDIR /root
COPY clang/install-clang.sh common/install-cmake.sh ./

ARG LLVM_VERSION
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends ca-certificates ninja-build git g++ curl xz-utils && \
    ./install-clang.sh $LLVM_VERSION && \
    ./install-cmake.sh && \
    rm install-clang.sh install-cmake.sh

ENV CC              clang
ENV CXX             clang++
ENV CMAKE_GENERATOR Ninja

