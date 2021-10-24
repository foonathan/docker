#!/usr/bin/env bash
# Adapted from https://github.com/silkeh/docker-clang/blob/master/install.sh.
set -eou pipefail

LLVM_VERSION=$1
case "${LLVM_VERSION}" in
6*)
  MIRROR="llvm"
  PLATFORM="linux-gnu-ubuntu-16.04"
  ;;
7*|8*|9*)
  MIRROR="llvm"
  PLATFORM="linux-gnu-ubuntu-18.04"
  ;;
10*)
  MIRROR="github"
  PLATFORM="linux-gnu-ubuntu-18.04"
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
cp -a "${TARGET}/"* "/usr/local/"

# Cleanup
rm -rf "${DOWNLOAD_FILE}" "${TARGET:?}/"

