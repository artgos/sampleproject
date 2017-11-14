#!/bin/sh

setup_git() {
  git config --global user.email "azagozdzinski@gmail.com"
  git config --global user.name "artzag"
  echo ${GH_TOKEN}
  echo $GH_TOKEN
}

commit_website_files() {
  git checkout -b gh-pages
  git add . *.html
  git commit --message "Travis build: $TRAVIS_BUILD_NUMBER"
}

upload_files() {
  git remote add origin-pages https://${GH_TOKEN}@github.com/artzag/sampleproject.git > /dev/null 2>&1
  git push --quiet --set-upstream origin master
}

setup_git
#commit_website_files
upload_files