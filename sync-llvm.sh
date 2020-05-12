#!/usr/bin/env bash

set -euo pipefail

CUR_DIR="$(dirname "$0")"

LLVM_DIR="${1:-""}"
PROJECTS=("llvm" "mlir")

if [[ ! -d $LLVM_DIR ]]; then
    echo "Usage: $0 LLVM_DIR"
    exit 1
fi

for proj in "${PROJECTS[@]}"; do
    rsync -av \
        --exclude="README" \
        --exclude="vimrc" \
        "$LLVM_DIR/$proj/utils/vim/" \
        "$CUR_DIR"
done
