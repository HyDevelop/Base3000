#!/usr/bin/env bash

# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
cd dist

# if you are deploying to a custom domain
echo 'b3k.hydev.org' > CNAME

git init
git add -A
git commit -m 'update'

# if you are deploying to https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:HyDevelop/Base3000.git master:gh-pages

cd -
