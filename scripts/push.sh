#!/bin/sh

setup_git() {
  git config --global user.email "travis@travis-ci.org"
  git config --global user.name "Travis CI"
}

commit_website_files() {
  git checkout -b gh-pages
  git add . *.html
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin-pages https://3Vp1Y3Vg1Copj2fp5bbp@github.com/artzag/sampleproject.git > /dev/null 2>&1
  git push --quiet --set-upstream origin master
}

setup_git
#commit_website_files
upload_files