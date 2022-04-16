#!/bin/bash

set -e

export BRANCH_WITH_CLANG_FORMAT=origin/master

# Fetch origin to ensure the .clang-format is present and updated
git fetch origin

git checkout upstream/vkQuake3
git reset --hard vkQuake3/master
git branch -D upstream/vkQuake3_formatted 2> /dev/null > /dev/null || echo "No Local branch, creating local branch and formatting"
git checkout -B upstream/vkQuake3_formatted
git show ${BRANCH_WITH_CLANG_FORMAT}:.clang-format > .clang-format
# shellcheck disable=SC2038
find code \
     \( -name '*.h' -or -name '*.c' \)  \
     ! -path 'code/AL/*' -and \
     ! -path 'code/curl-7.54.0/*' -and \
     ! -path 'code/jpeg-8c/*' -and \
     ! -path 'code/libogg-1.3.3/*' -and \
     ! -path 'code/libvorbis-1.3.6/*' -and \
     ! -path 'code/opus-1.2.1/*' -and \
     ! -path 'code/opusfile-0.9/*' -and \
     ! -path 'code/SDL2/*' -and \
     ! -path 'code/tools/*' -and \
     ! -path 'code/zlib/*' \
     | xargs clang-format -i
git add code/
rm .clang-format
git commit -m "Format the source code with clang-format to simplify cross-branch comparisons"
git push origin :upstream/vkQuake3_formatted 2> /dev/null > /dev/null || echo "No upstream/vkQuake3_formatted branch to delete"
git push --set-upstream origin upstream/vkQuake3_formatted

# Return to master branch on completion
git checkout master
