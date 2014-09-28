#!/bin/sh

echo "==========================================="
echo
echo
echo "Compiling .sass to .css"
sass --update site:site
echo

echo "Opening page in browser..."
open -a firefox site/index.html
echo

git status
echo
echo
echo
echo
echo "You should probably commit now."
