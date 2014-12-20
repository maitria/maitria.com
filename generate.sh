#!/bin/sh

page="/$1"
browser="firefox"

echo "By the way, I'm about to kill any python stuff running."
echo "And I'm also going kill Firefox."
echo "You'll wish you'd read this someday."
killall python
killall $browser

echo "==========================================="
echo
echo
echo "Compiling .sass to .css"
sass --update site:site
echo

#destroy previously generated site
rm site/index.html
lein run

cd site
python -m SimpleHTTPServer &

echo "Opening page in browser..."
open -a $browser http://localhost:8000$page
echo

git status
echo
echo
echo
echo

echo "If you like what you see on :8000, you should probably commit now."
