#!/usr/bin/env bash
# Adapted from https://github.com/silkeh/docker-clang/blob/master/install.sh.
set -eou pipefail

LLVM_VERSION=$1
case "${LLVM_VERSION}" in
6*|7*)
    MIRROR="llvm"
    if [ $(uname -m) = "x86_64" ]; then
        PLATFORM="x86_64-linux-gnu-ubuntu-16.04"
    elif [ $(uname -m) = "aarch64" ]; then
        PLATFORM="aarch64-linux-gnu"
    else
        echo "unknown architecture" >/dev/stderr
        exit 1
    fi
    ;;
8*|9*)
    MIRROR="llvm"
    if [ $(uname -m) = "x86_64" ]; then
        PLATFORM="x86_64-linux-gnu-ubuntu-18.04"
    elif [ $(uname -m) = "aarch64" ]; then
        PLATFORM="aarch64-linux-gnu"
    else
        echo "unknown architecture" >/dev/stderr
        exit 1
    fi
    ;;
10*)
    MIRROR="github"
    if [ $(uname -m) = "x86_64" ]; then
        PLATFORM="x86_64-linux-gnu-ubuntu-18.04"
    elif [ $(uname -m) = "aarch64" ]; then
        PLATFORM="aarch64-linux-gnu"
    else
        echo "unknown architecture" >/dev/stderr
        exit 1
    fi
    ;;
11*|12*|13*)
    MIRROR="github"
    if [ $(uname -m) = "x86_64" ]; then
        PLATFORM="x86_64-linux-gnu-ubuntu-20.04"
    elif [ $(uname -m) = "aarch64" ]; then
        PLATFORM="aarch64-linux-gnu"
    else
        echo "unknown architecture" >/dev/stderr
        exit 1
    fi
    ;;
14*|15*)
    MIRROR="github"
    if [ $(uname -m) = "x86_64" ]; then
        PLATFORM="x86_64-linux-gnu-ubuntu-18.04"
    elif [ $(uname -m) = "aarch64" ]; then
        PLATFORM="aarch64-linux-gnu"
    else
        echo "unknown architecture" >/dev/stderr
        exit 1
    fi
    ;;
16*)
    MIRROR="github"
    if [ $(uname -m) = "x86_64" ]; then
        PLATFORM="x86_64-linux-gnu-ubuntu-22.04"
    elif [ $(uname -m) = "aarch64" ]; then
        PLATFORM="aarch64-linux-gnu"
    else
        echo "unknown architecture" >/dev/stderr
        exit 1
    fi
    ;;
17*)
    MIRROR="github"
    if [ $(uname -m) = "x86_64" ]; then
        PLATFORM="x86_64-linux-gnu-ubuntu-22.04"
    elif [ $(uname -m) = "aarch64" ]; then
        PLATFORM="aarch64-linux-gnu"
    else
        echo "unknown architecture" >/dev/stderr
        exit 1
    fi
    ;;
18*)
    MIRROR="github"
    if [ $(uname -m) = "x86_64" ]; then
        PLATFORM="x86_64-linux-gnu-ubuntu-18.04"
    elif [ $(uname -m) = "aarch64" ]; then
        PLATFORM="aarch64-linux-gnu"
    else
        echo "unknown architecture" >/dev/stderr
        exit 1
    fi
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

# Install dependency.
apt-get install -y --no-install-recommends libtinfo5

# Set install target and download file
TARGET="clang+llvm-${LLVM_VERSION}-${PLATFORM}"
DOWNLOAD="clang+llvm-${LLVM_VERSION}-${PLATFORM}.tar.xz"
DOWNLOAD_FILE="llvm.tar.xz"

# Download
echo "Downloading ${DOWNLOAD}"
curl -L "${MIRROR_URL}/${DOWNLOAD}" --output "${DOWNLOAD_FILE}"

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

