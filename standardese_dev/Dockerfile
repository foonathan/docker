FROM foonathan/micro_cpp_llvm

# download boost sources
RUN wget --no-check-certificate -q https://dl.bintray.com/boostorg/release/1.67.0/source/boost_1_67_0.tar.gz -O boost.tar.gz \
    && tar -xf boost.tar.gz && mv boost_1_67_0/ boost-source/ \
# build b2
    && cd boost-source/tools/build \
    && ./bootstrap.sh && ./b2 install \
    && cd /root \
# build the Boost libraries as statically linked libraries
    && mkdir boost-build && cd boost-source \
    && b2 --build-dir=../boost-build --with-filesystem --with-program_options toolset=gcc variant=release link=static runtime-link=static install \
    && cd /root \
# clean-up the build files
    && rm -r boost.tar.gz boost-source/ boost-build/

# add the build script and execute it by default
ADD build.bash /root
CMD ./build.bash

