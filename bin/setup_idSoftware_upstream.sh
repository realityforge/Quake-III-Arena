#!/bin/bash

#
# A bash script that sets up a remote to the idSoftware repository and a branch
# named "upstream/idSoftware" that pulls from "idSoftware/master" and pushes to
# the origin repository.
#

set -e

git remote rm idSoftware 2> /dev/null > /dev/null || (echo "idSoftware remote not present")
git remote add --no-tags --track master idSoftware https://github.com/id-Software/Quake-III-Arena
git fetch idSoftware

git checkout idSoftware/master
git branch -D upstream/idSoftware 2> /dev/null > /dev/null || (echo "idSoftware upstream branch not present")
git checkout -B upstream/idSoftware
git config branch.upstream/idSoftware.remote idSoftware
git config branch.upstream/idSoftware.merge refs/heads/master
git config branch.upstream/idSoftware.pushRemote origin
git gc --prune=now --aggressive
git push

git checkout master
