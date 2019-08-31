#! /bin/bash

pwd
git add .
git commit -sm "blog: travel: update post $1"
git fetch origin && git rebase origin/master
git push origin master
