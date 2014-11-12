#!/bin/sh

echo "==========================================="
echo
echo
echo
git status
echo

check_if_committed=`git status --porcelain`
if ! [[ "$check_if_committed" = "" ]]
then
  echo "=========================================="
  echo "No, you can't deploy without committing."
  echo "=========================================="
  exit 1
fi

branch=`git rev-parse --abbrev-ref HEAD`
if ! [[ "$branch" = "master" ]]
then
  echo "=========================================="
  echo "NO NO NO you can't deploy from this branch"
  echo "=========================================="
  exit 1
fi

echo 'pushing to master'
git push origin master:master
if [[ $? -ne 0 ]]
then
  echo "=========================================="
  echo "   FAILED TO PUSH                         "
  echo "=========================================="
  exit 1
fi

echo 'pushed'
echo
echo 'deploying to maitria webserver'
rsync -r --progress --delete ./site/ root@104.131.105.47:/srv/maitria.com 
echo 'deployed'
