#!/usr/bin/env bash
set -eou pipefail

MIRROR_URL="https://github.com/Kitware/CMake/releases/download/v3.21.3/"
DOWNLOAD="cmake-3.21.3-linux-x86_64.sh"
DOWNLOAD_FILE="cmake.sh"

# Download
echo "Downloading ${DOWNLOAD}"
wget -nv -O "${DOWNLOAD_FILE}" "${MIRROR_URL}/${DOWNLOAD}"

# Install
echo "Installing CMakee"
bash "${DOWNLOAD_FILE}" --skip-license --prefix=/usr/local --exclude-subdir

# Cleanup
rm "${DOWNLOAD_FILE}"

