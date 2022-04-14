#!/bin/bash

#
# A bash script that configures the git to make it easy to track remote
# repositories. For an upstream repository named "foo" a branch named
# "upstream/foo" will be created that pulls from the remote repository
# and pushes to origin.
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

git remote rm ioq3 2> /dev/null > /dev/null || (echo "ioq3 remote not present")
git remote add --no-tags --track main ioq3 https://github.com/ioquake/ioq3.git
git fetch ioq3

git checkout ioq3/main
git branch -D upstream/ioq3 2> /dev/null > /dev/null || (echo "ioq3 upstream branch not present")
git checkout -B upstream/ioq3
git config branch.upstream/ioq3.remote ioq3
git config branch.upstream/ioq3.merge refs/heads/main
git config branch.upstream/ioq3.pushRemote origin
git rm --force -r .github/workflows
git commit -m "Remove workflows from upstream branch to avoid executing actions unnecessarily"
git gc --prune=now --aggressive
git push -f

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

git remote rm vkQuake3 2> /dev/null > /dev/null || (echo "vkQuake3 remote not present")
git remote add --no-tags --track master vkQuake3 https://github.com/suijingfeng/vkQuake3.git
git fetch vkQuake3

git checkout vkQuake3/master
git branch -D upstream/vkQuake3 2> /dev/null > /dev/null || (echo "vkQuake3 upstream branch not present")
git checkout -B upstream/vkQuake3
git config branch.upstream/vkQuake3.remote vkQuake3
git config branch.upstream/vkQuake3.merge refs/heads/master
git config branch.upstream/vkQuake3.pushRemote origin
git gc --prune=now --aggressive
git push

git checkout master
