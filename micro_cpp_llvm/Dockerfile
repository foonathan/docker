FROM foonathan/micro_cpp_gcc

# install build dependencies
RUN apk add --no-cache python3 ninja \
# download source code
    && wget -q http://releases.llvm.org/6.0.1/llvm-6.0.1.src.tar.xz -O llvm.tar.xz \
    && wget -q http://releases.llvm.org/6.0.1/cfe-6.0.1.src.tar.xz  -O clang.tar.xz \
# extract
    && tar -xf llvm.tar.xz && tar -xf clang.tar.xz \
    && mv llvm-6.0.1.src llvm-src && mv cfe-6.0.1.src llvm-src/tools/clang \
# build
    && mkdir llvm-build && mkdir /opt/llvm \
    && cd llvm-build \
    && cmake -G"Ninja" -DCMAKE_INSTALL_PREFIX="/opt/llvm" -DCMAKE_BUILD_TYPE=Release \
                       -DLIBCLANG_BUILD_STATIC=ON -DLLVM_BUILD_EXAMPLES=OFF -DLLVM_BUILD_TESTS=OFF \
                        ../llvm-src \
    && cmake --build . \
    && cmake --build . --target install \
    && cd ../ \
# remove build files
    && rm -r llvm-src/ llvm-build/ \
    && rm llvm.tar.xz clang.tar.xz \
# remove contents of share and libexec directory (it is not needed for our purposes)
    && rm -r /opt/llvm/share/* \
    && rm -r /opt/llvm/libexec/* \
# remove unnecessary tools (i.e. not clang and not llvm-config)
    && find /opt/llvm/bin -type f -not -name 'clang-6.0' -not -name 'llvm-config' -delete \
# remove symlinks broken by the command above
    && find -L /opt/llvm/bin -maxdepth 1 -type l -delete \
# remove shared libraries that were built anyway
    && find /opt/llvm/lib \( -type f -or -type l \) \( -name '*.so' -or -name '*.so.*' \) -delete \
# remove build dependencies
    && apk del -r python3 ninja

# update PATH
ENV PATH="/opt/llvm/bin:${PATH}"

