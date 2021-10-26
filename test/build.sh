set -eou pipefail

cmake /src
cmake --build .
ctest

