#! /bin/bash

CUR_DIR=$(pwd)
GITBOOK_DIR="$CUR_DIR/_book"
DEPLOY_DIR="$CUR_DIR/docs"

echo $GITBOOK_DIR $DEPLOY_DIR

rm -r $DEPLOY_DIR/*
cp -R $GITBOOK_DIR/* $DEPLOY_DIR

git clean -fx $GITBOOK_DIR
