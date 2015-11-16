#!/bin/bash

# internal variables
VERSION=`date +"%Y.%m%d.%H%M"`
COMMIT="$VERSION [ci skip]"

# setup master as our desitation
git config --global user.email "buildbot@cqscloud.com"
git config --global user.name "BuildBot"
git config branch.master.remote origin
git config branch.master.merge refs/heads/master

# package version
sed -i -e "s/\"version\": \"1.0.0\"/\"version\": \"$VERSION\"/" package.json

# add to git
git add -A
git commit --allow-empty -m "$COMMIT"
git merge --no-edit -s ours -m "$COMMIT" origin/master

# tag release and push
git tag $VERSION
git push --force --tags origin HEAD:master
