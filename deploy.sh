#!/bin/bash
. colors.bash

browser="firefox"
killall python
killall $browser
(cd site; python -m SimpleHTTPServer &)
sleep 1

echo "Opening page in browser..."
open -a $browser http://localhost:8000
echo

printf $blu
echo "===================================================="
echo 'Check out your site! Happy? Continue deploying? y/n'
echo "===================================================="
printf $end
read answer
if ! [[ ".y.yes.Y.Yes.YES." =~ ".${answer}." ]]
then
  printf $red
  echo "=========================================="
  echo " FAILED: YOU DECIDED NOT TO DEPLOY :)     "
  echo "=========================================="
  printf $end
  exit 1
fi

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
