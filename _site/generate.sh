#!/bin/bash
. colors.bash

page="/$1"

echo "By the way, I'm about to kill any python stuff running."
echo "And I'm also going kill Firefox."
echo "You'll wish you'd read this someday."
killall python

#destroy previously generated site
rm site/index.html
rm site/yourself.html
rm site/coc.html
rm site/speaking.html
rm site/*.css

echo "==========================================="
echo
echo
echo "Compiling .sass to .css"
sass --update sass:site
echo

lein run

(cd site; python -m SimpleHTTPServer &)

git status
echo
echo
echo
echo

echo "If you like what you see on :8000, you should probably commit now."
