#!/bin/bash

set -e

export BRANCH_WITH_CLANG_FORMAT=origin/BazelBuild

# Fetch all the remotes
git fetch --all

# Fetch origin to ensure the .clang-format is present and updated
git fetch origin

git checkout upstream/ioq3quest
git reset --hard ioq3quest/master
git branch -D upstream/ioq3quest_formatted 2> /dev/null > /dev/null || echo "No Local branch, creating local branch and formatting"
git checkout -B upstream/ioq3quest_formatted
git show ${BRANCH_WITH_CLANG_FORMAT}:.clang-format > .clang-format
# shellcheck disable=SC2038
find android/app/src/main/cpp/code \
     \( -name '*.h' -or -name '*.c' \)  \
     ! -path 'android/app/src/main/cpp/code/AL/*' -and \
     ! -path 'android/app/src/main/cpp/code/curl-7.54.0/*' -and \
     ! -path 'android/app/src/main/cpp/code/jpeg-8c/*' -and \
     ! -path 'android/app/src/main/cpp/code/libogg-1.3.3/*' -and \
     ! -path 'android/app/src/main/cpp/code/libvorbis-1.3.6/*' -and \
     ! -path 'android/app/src/main/cpp/code/opus-1.2.1/*' -and \
     ! -path 'android/app/src/main/cpp/code/opusfile-0.9/*' -and \
     ! -path 'android/app/src/main/cpp/code/SDL2/*' -and \
     ! -path 'android/app/src/main/cpp/code/tools/*' -and \
     ! -path 'android/app/src/main/cpp/code/zlib/*' \
     | xargs clang-format -i
git add android/app/src/main/cpp/code/
rm .clang-format
git commit -m "Format the source code with clang-format to simplify cross-branch comparisons"
git push origin :upstream/ioq3quest_formatted 2> /dev/null > /dev/null || echo "No upstream/ioq3quest_formatted branch to delete"
git push -f --set-upstream origin upstream/ioq3quest_formatted

git checkout upstream/ioq3
git reset --hard ioq3/main
git branch -D upstream/ioq3_formatted 2> /dev/null > /dev/null || echo "No Local branch, creating local branch and formatting"
git checkout -B upstream/ioq3_formatted
pwd
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
git push origin :upstream/ioq3_formatted 2> /dev/null > /dev/null || echo "No upstream/ioq3_formatted branch to delete"
git push -f --set-upstream origin upstream/ioq3_formatted

git checkout upstream/quake3e
git reset --hard quake3e/master
git branch -D upstream/quake3e_formatted 2> /dev/null > /dev/null || echo "No Local branch, creating local branch and formatting"
git checkout -B upstream/quake3e_formatted
git show ${BRANCH_WITH_CLANG_FORMAT}:.clang-format > .clang-format
# shellcheck disable=SC2038
find code \
     \( -name '*.h' -or -name '*.c' \)  \
     ! -path 'code/libcurl/*' -and \
     ! -path 'code/libjpeg/*' -and \
     ! -path 'code/libsdl/*' -and \
     ! -path 'code/renderercommon/vulkan/*' \
     | xargs clang-format -i
git add code/
rm .clang-format
git commit -m "Format the source code with clang-format to simplify cross-branch comparisons"
git push origin :upstream/quake3e_formatted || echo "No upstream/quake3e_formatted branch to delete"
git push --set-upstream origin upstream/quake3e_formatted

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
