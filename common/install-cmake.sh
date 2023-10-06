#!/usr/bin/env bash
set -eou pipefail

MIRROR_URL="https://github.com/Kitware/CMake/releases/download/v3.23.2/"
DOWNLOAD_X86="cmake-3.23.2-linux-x86_64.sh"
DOWNLOAD_ARM="cmake-3.23.2-linux-aarch64.sh"
DOWNLOAD_FILE="cmake.sh"

if [ $(uname -m) = "x86_64" ]; then
    DOWNLOAD=$DOWNLOAD_X86
elif [ $(uname -m) = "aarch64" ]; then
    DOWNLOAD=$DOWNLOAD_ARM
else
    echo "unknown architecture" >/dev/stderr
    exit 1
fi

# Download
echo "Downloading ${DOWNLOAD}"
curl -L "${MIRROR_URL}/${DOWNLOAD}" --output "${DOWNLOAD_FILE}"

# Install
echo "Installing CMakee"
bash "${DOWNLOAD_FILE}" --skip-license --prefix=/usr/local --exclude-subdir

# Cleanup
rm "${DOWNLOAD_FILE}"

