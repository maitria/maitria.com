#!/bin/sh

branch=`git rev-parse --abbrev-ref HEAD`
if ! [[ "$branch" = "master" ]]
then
  echo "=========================================="
  echo "NO NO NO you can't deploy from this branch"
  exit 1
fi

echo 'pushing to master'
git push origin master:master
echo 'pushed'
echo 'deploying to maitria webserver'
rsync -r --progress ./ root@104.131.105.47:/srv/maitria.com 
echo 'deployed'
