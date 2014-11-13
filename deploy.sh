#!/bin/bash

red=$'\e[1;31m'
grn=$'\e[1;32m'
yel=$'\e[1;33m'
blu=$'\e[1;34m'
mag=$'\e[1;35m'
cyn=$'\e[1;36m'
end=$'\e[0m'

echo "==========================================="
echo
echo
echo
git status
echo

check_if_committed=`git status --porcelain`
if ! [[ "$check_if_committed" = "" ]]
then
  printf $red
  echo "=========================================="
  echo " FAILED: COMMIT FIRST BEFORE DEPLOYING    "
  echo "=========================================="
  printf $end
  exit 1
fi

branch=`git rev-parse --abbrev-ref HEAD`
if ! [[ "$branch" = "master" ]]
then
  printf $red
  echo "=========================================="
  echo " FAILED: WRONG BRANCH                     "
  echo "=========================================="
  printf $end
  exit 1
fi

echo 'pushing to master'
git push origin master:master
if [[ $? -ne 0 ]]
then
  printf $red
  echo "=========================================="
  echo " PUSH FAILED: ABORTING DEPLOY             "
  echo "=========================================="
  printf $end
  exit 1
fi

echo 'pushed'
echo
echo 'deploying to maitria webserver'
rsync -r --progress --delete ./site/ root@104.131.105.47:/srv/maitria.com 
printf $grn
echo "=========================================="
echo " Success! Deployed                        "
echo "=========================================="
printf $end
