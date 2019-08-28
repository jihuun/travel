#! /bin/bash

CUR_DIR=$(pwd)
GITBOOK_DIR="$CUR_DIR/_book"
NODEMODULS_DIR="$CUR_DIR/node_modules"
DEPLOY_DIR="$CUR_DIR/docs"

echo $GITBOOK_DIR $DEPLOY_DIR

rm -r $DEPLOY_DIR/*
cp -R $GITBOOK_DIR/* $DEPLOY_DIR
rm -r $DEPLOY_DIR/docs

git clean -fx $GITBOOK_DIR

git add .
git branch
git checkout master
git commit -sm "blog: travel: update gitbook by TravisCI with build $TRAVIS_BUILD_NUMBER"
git branch
git log -2
git push "https://${GH_TOKEN}@github.com/jihuun/travel" master
#git add .
#git commit -sm "blog: travel: build & deploy with previous commit [by travis]"
#git push origin master
