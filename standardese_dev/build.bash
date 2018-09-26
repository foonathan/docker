#!/bin/bash

if [[ ! -d "standardese" ]]; then
    echo "error: need to mount /root/standardese to standardese source files" >/dev/stderr
    exit 1
fi
if [[ ! -d "output" ]]; then
    echo "error: need to mount /root/output to some directory that should contain the result" >/dev/stderr
    exit 1
fi

set -e
mkdir build && cd build
cmake -DCMAKE_EXE_LINKER_FLAGS="-static -static-libstdc++ -static-libgcc" -DCLANG_BINARY="clang++" ../standardese
cmake --build . --target standardese_tool -j $(nproc)
cp tool/standardese ../output/
chmod ugoa=rwx ../output/standardese

