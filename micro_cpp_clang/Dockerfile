FROM foonathan/micro_cpp_base

# install clang (g++ is needed for libstdc++)
RUN apk update && apk add --no-cache g++ clang

# setup clang as compiler
ENV CC  clang
ENV CXX clang++

