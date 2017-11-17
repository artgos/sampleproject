#!/bin/bash
YEAR=$(date +"%Y")
MONTH=$(date +"%m")
export VERSION_NO=$(python -c 'from sample import VERSION as version; print(version)');
export APP_NAME=sample
git config --global user.email "builds@travis-ci.com"
git config --global user.name "Travis CI"
git config --global push.default simple
export GIT_TAG=$APP_NAME-$VERSION_NO
git fetch --tags
msg="Tag Generated from TravisCI on branch $TRAVIS_BRANCH for build $TRAVIS_BUILD_NUMBER ($YEAR-$MONTH)"
echo $msg
echo $GIT_TAG
#if git tag $GIT_TAG -a -m "$msg" 2>/dev/null; then
git tag $GIT_TAG -a -m "$msg"
 git push origin $TRAVIS_BRANCH && git push origin $TRAVIS_BRANCH --tags
#ls -aR
#else echo Tag already exists!; fi
