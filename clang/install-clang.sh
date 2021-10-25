#!/usr/bin/env bash
# Adapted from https://github.com/silkeh/docker-clang/blob/master/install.sh.
set -eou pipefail

LLVM_VERSION=$1
case "${LLVM_VERSION}" in
6*|7*)
  MIRROR="llvm"
  PLATFORM="linux-gnu-ubuntu-16.04"
  ;;
8*|9*)
  MIRROR="llvm"
  PLATFORM="linux-gnu-ubuntu-18.04"

  apt-get install -y --no-install-recommends libtinfo5
  ;;
10*)
  MIRROR="github"
  PLATFORM="linux-gnu-ubuntu-18.04"

  apt-get install -y --no-install-recommends libtinfo5
  ;;
11*|12*|13*)
  MIRROR="github"
  PLATFORM="linux-gnu-ubuntu-20.04"
  ;;
esac

case "${MIRROR}" in
  "github")
    MIRROR_URL="https://github.com/llvm/llvm-project/releases/download/llvmorg-${LLVM_VERSION}"
    ;;
  "llvm")
    MIRROR_URL="http://releases.llvm.org/${LLVM_VERSION}"
    ;;
esac

# Set install target and download file
TARGET="clang+llvm-${LLVM_VERSION}-x86_64-${PLATFORM}"
DOWNLOAD="clang+llvm-${LLVM_VERSION}-x86_64-${PLATFORM}.tar.xz"
DOWNLOAD_FILE="llvm.tar.xz"

# Download
echo "Downloading ${DOWNLOAD}"
wget -nv -O "${DOWNLOAD_FILE}" "${MIRROR_URL}/${DOWNLOAD}"

# Install
echo "Installing ${TARGET}"
tar xf "${DOWNLOAD_FILE}"
# Delete all binaries that are not clang-Major
find ${TARGET}/bin -type f -not -regex '.*/clang-[0-9].*' -delete
# Delete all now broken symlinks.
find -L ${TARGET}/bin -maxdepth 1 -type l -delete
# Copy the remaining binaries over.
cp -a ${TARGET}/bin/* /usr/local/bin/
# And the necessary libs.
cp -a ${TARGET}/lib/clang/ /usr/local/lib/

# Cleanup
rm -rf "${DOWNLOAD_FILE}" "${TARGET:?}/"

