#!/bin/sh

setup_git() {
  git config --global user.email "builds@travis-ci.com"
  git config --global user.name "Travis CI"
  echo ${GH_TOKEN}
  echo $GH_TOKEN
}

commit_website_files() {
  git checkout -b gh-pages
  git add . *.html
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

tag() {
    export GIT_TAG=$TRAVIS_BRANCH-V2.$YEAR-$MONTH.$TRAVIS_BUILD_NUMBER
    git fetch --tags
    msg="Tag Generated from TravisCI for build $TRAVIS_BUILD_NUMBER"
    echo $msg
    echo $GIT_TAG
    #if git tag $GIT_TAG -a -m "$msg" 2>/dev/null; then
    git tag $GIT_TAG -a -m "Tag Generated from TravisCI for build $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  #git remote add origin-pages https://${GH_TOKEN}@github.com/artzag/sampleproject.git > /dev/null 2>&1
  #git push --quiet --set-upstream origin master
  git push origin master && git push origin master --tags
}

setup_git
tag
#commit_website_files
upload_files