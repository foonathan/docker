set -eou pipefail

cmake -GNinja /src
cmake --build .
ctest

