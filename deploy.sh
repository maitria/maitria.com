#!/bin/bash
. colors.bash

browser="firefox"
killall python
killall $browser
(cd site; python -m SimpleHTTPServer &)
sleep 1

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
if [[ $? -ne 0 ]]
then
  printf $grn
  echo "=========================================="
  echo " Success! Deployed                        "
  echo "=========================================="
  printf $end
else
  printf $red
  echo "=========================================="
  echo " DEPLOY FAILED                            "
  echo "=========================================="
  printf $end
  exit 1
fi
