#! /bin/bash

git checkout develop
git pull
git checkout -
git rebase develop
