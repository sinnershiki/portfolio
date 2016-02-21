#!/bin/sh
eval "$(ssh-agent -s)"
chmod 600 .travis/deploy_key
ssh-add .travis/deploy_key
git remote add deploy ssh://sugano@sinnershiki.com:10022/home/sugano/portfolio.git
git push deploy master
