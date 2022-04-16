#!/bin/bash

set -e

export BRANCH_WITH_CLANG_FORMAT=origin/master

# Fetch origin to ensure the .clang-format is present and updated
git fetch origin

git remote rm ioq3quest 2> /dev/null > /dev/null || (echo "ioq3quest remote not present")
git remote add --no-tags --track master ioq3quest https://github.com/DrBeef/ioq3quest.git
git fetch ioq3quest

git checkout ioq3quest/master
git branch -D upstream/ioq3quest 2> /dev/null > /dev/null || (echo "ioq3quest upstream branch not present")
git checkout -B upstream/ioq3quest
git config branch.upstream/ioq3quest.remote ioq3quest
git config branch.upstream/ioq3quest.merge refs/heads/master
git config branch.upstream/ioq3quest.pushRemote origin
git rm --force -r .github/workflows
git commit -m "Remove workflows from upstream branch to avoid executing actions unnecessarily"
git gc --prune=now --aggressive
git push -f

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

# Return to master branch on completion
git checkout master
