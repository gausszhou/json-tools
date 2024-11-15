#!/usr/bin/env sh

set -e

rm -rf dist

# build
pnpm i
pnpm build

# push

cd dist/json-tools

git init
git add .

git remote add origin git@github.com:gausszhou/json-tools.git

git checkout -b gh-pages
time=$(date "+%Y-%m-%d %H:%M")
git commit -m "gh-pages: update in $time $1"
git push origin gh-pages -f

cd -