#!/bin/sh

# This script depends on the gem github-markdown-preview

preview_file="$1"
browser="firefox"
html_filename=$preview_file.html

github-markdown-preview $preview_file &
wait 1
open -a $browser $html_filename
