FROM foonathan/micro_cpp_gcc

# install build dependencies
RUN apk add python3 ninja

# download source code
RUN wget -q http://releases.llvm.org/6.0.1/llvm-6.0.1.src.tar.xz -O llvm.tar.xz; \
    wget -q http://releases.llvm.org/6.0.1/cfe-6.0.1.src.tar.xz  -O clang.tar.xz

# extract
RUN tar -xf llvm.tar.xz && tar -xf clang.tar.xz
RUN mv llvm-6.0.1.src llvm-src && mv cfe-6.0.1.src llvm-src/tools/clang

# build
RUN mkdir llvm-build && mkdir llvm
RUN cd llvm-build && cmake -G"Ninja" -DCMAKE_INSTALL_PREFIX="../llvm" -DCMAKE_BUILD_TYPE=Release \
                           -DLIBCLANG_BUILD_STATIC=ON -DLLVM_BUILD_EXAMPLES=OFF -DLLVM_BUILD_TESTS=OFF \
                            ../llvm-src
RUN cd llvm-build && cmake --build .
RUN cd llvm-build && cmake --build . --target install

# remove build files
RUN rm -r llvm-src/ llvm-build/

# remove build dependencies
RUN apk del python3 ninja

