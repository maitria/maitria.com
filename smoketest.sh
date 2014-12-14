#!/bin/sh

echo "By the way, I'm about to kill any python stuff running."
killall python

echo "==========================================="
echo
echo
echo "Compiling .sass to .css"
sass --update site:site
echo

cd site
python -m SimpleHTTPServer &

sleep .1

page="/$1"
echo "Opening page in browser..."
open -a firefox http://localhost:8000$page
echo

git status
echo
echo
echo
echo
echo "If you like what you see on :8000, you should probably commit now."
