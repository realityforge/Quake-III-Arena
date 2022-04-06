#!/bin/bash

FILE_COUNT=$#
let FILE_COUNT+=-2

PREFIX=$1
TARGET=$2

shift
shift

echo "Copying ${FILE_COUNT} files from base $PREFIX to $TARGET"

for file in "$@"; do
  mkdir -p "pak/$(dirname "${file#$PREFIX}")" || (echo "Failed to make directory ${file#$PREFIX}" && exit 3)
  [ -e "pak/${file#$PREFIX}" ] && echo "File exists when copying from $PREFIX - ${file#$PREFIX}" && exit 4
  cp "${file}" "pak/${file#$PREFIX}" || (echo "Failed to copy file ${file} to pak/${file#$PREFIX}" && exit 2)
done
