#!/bin/bash

FILE_COUNT=$#
let FILE_COUNT+=-2

PREFIX=$1
TARGET=$2

shift
shift

echo "Copying ${FILE_COUNT} files from base $PREFIX to $TARGET"

for file in "$@"; do
  target="$(tr '[:upper:]' '[:lower:]' <<< "${file#$PREFIX}")"
  mkdir -p "pak/$(dirname "${target}")" || (echo "Failed to make directory for ${target}" && exit 3)
  [ -e "pak/${target}" ] && echo "File exists when copying from $PREFIX - ${target}" && exit 4
  cp "${file}" "pak/${target}" || (echo "Failed to copy file ${file} to pak/${target}" && exit 2)
done
