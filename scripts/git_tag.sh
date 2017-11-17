#!/bin/sh

setup_git() {
  git config --global user.email "builds@travis-ci.com"
  git config --global user.name "Travis CI"
}

tag() {
    YEAR=$(date +"%Y")
    MONTH=$(date +"%m")
    export VERSION_NO=$(python -c 'from sample import VERSION as version; print(version)');
    export APP_NAME=sample
    export GIT_TAG=$APP_NAME-$VERSION_NO
    git fetch --tags
    msg="Tag Generated from TravisCI on branch $TRAVIS_BRANCH for build $TRAVIS_BUILD_NUMBER ($YEAR-$MONTH)"
    echo $msg
    echo $GIT_TAG
    git tag $GIT_TAG -a -f -m "$msg"
}

upload_files() {
  git push origin $TRAVIS_BRANCH && git push origin $TRAVIS_BRANCH --tags
}

setup_git
tag
upload_files
