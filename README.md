# foonathan/docker

[![Build Status](https://dev.azure.com/foonathan/docker/_apis/build/status/foonathan.docker)](https://dev.azure.com/foonathan/docker/_build/latest?definitionId=1)

This is a collection of docker containers I use.
They're designed to be very lightweight (compressed size is below 200MB) and can be used to compile C++ projects into fully statically linked binaries that are compatible with any Linux distribution.

Currently there are:

* `foonathan/micro_cpp_base`: the base image for all containers; it just has the bare build essentials
* `foonathan/micro_cpp_gcc`: image for building with GCC (the latest one in the Alpine package manager)
* `foonathan/micro_cpp_clang`: image for building with clang (the latest one in the Alpine package manager)
* `foonathan/micro_cpp_llvm`: image containing the latest LLVM and clang

Use them as your base image and install additional dependencies as needed, then build your own project.
See `foonathan/standardese_dev` as an example.

