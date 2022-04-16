#!/bin/bash

#
# A bash script that sets up a remote to the quake3e repository and a branch
# named "upstream/quake3e" that pulls from "quake3e/master" and pushes to
# the origin repository. A branch named "upstream/quake3e_formatted" is also
# setup that is the code from the quake3e repository formatted by the current
# projects code style (to make code comparisons easier)
#

set -e

export BRANCH_WITH_CLANG_FORMAT=origin/master

# Fetch origin to ensure the .clang-format is present and updated
git fetch origin

git remote rm quake3e 2> /dev/null > /dev/null || (echo "quake3e remote not present")
git remote add --no-tags --track master quake3e https://github.com/ec-/Quake3e.git
git fetch quake3e

git checkout quake3e/master
git branch -D upstream/quake3e 2> /dev/null > /dev/null || (echo "quake3e upstream branch not present")
git checkout -B upstream/quake3e
git config branch.upstream/quake3e.remote quake3e
git config branch.upstream/quake3e.merge refs/heads/master
git config branch.upstream/quake3e.pushRemote origin
git rm --force -r .github/workflows
git commit -m "Remove workflows from upstream branch to avoid executing actions unnecessarily"
git gc --prune=now --aggressive
git push -f

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

# Return to master branch on completion
git checkout master
