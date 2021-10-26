ARG GCC_VERSION
FROM gcc:${GCC_VERSION}
LABEL maintainer="Jonathan Müller <jonathanmueller.dev@gmail.com>"

WORKDIR /root
COPY common/install-cmake.sh ./

RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends ninja-build && \
    ./install-cmake.sh && \
    rm install-cmake.sh

ENV CMAKE_GENERATOR Ninja

