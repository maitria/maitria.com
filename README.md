#maitira.com

## What is it?
It's the website for [maitria.com](maitria.com). It started just HTML & CSS. Duplication meant it was time to pull in SASS, and now here comes Clojure. It's definitely a place for learning.

## Why is our website open source? 
- to add to beginner-friendly open source possibilities
- we like making friends
- we might need help sometime 
- you might want to use it for your website
- we can learn together

###technology
- html
- sass
- some bash scripts (see below)
- clostache (a mustache like thing)

###beginner info!
We'd love a contribution from you. If you're a total beginner, you can get some practice here, if you want.

Learning HTML? Fix a typo, and make your first pull request. If you're learning SASS, help us reduce duplication. Anybody want to learn Clojure web dev with me? :D &mdash; Alex 

####ask us
If you are new to the whole open-source, forking repos, pull requests, even coding thing, but you think you can do the edits to fix a typo or whatever, *get in touch with us* and if we can work the timing out, we'll talk you through it, walk you through it, or remote-pair or something. We'd love that.

####pull requests
Check out the github document [Using Pull Requests](https://help.github.com/articles/using-pull-requests/), and this one will tell you how to [Fork a Repo](https://help.github.com/articles/fork-a-repo/). If those aren't clear enough, *ask questions*.

####editing html
This site builds the .html by putting together .mustache files. You'll find them in /resources. The mixins or whatever are in /resources/partials, and appear in the website as {{>name-of-mixin}}. That should be enough to get you started, so you can fix a typo or something.

####be sure and read...
...the little bit about bash scripts below. You'll need to edit generate.sh.

####feedback
So much of tech writing is really hard to understand. If there's something you don't understand, please let us know. It's a failing on our part, not yours. 

###plans
We want to get testing set up soon. And later, try James Shore's new ideas about test driving CSS. 
We're planning to add a Clojure static blog engine.  
There's still some duplication to extract, especially in SASS (CSS).

###the bash scripts
There are two bash scripts. Well, three.
- `generate.sh` generates the .html from .html.mustache and compiles SASS to CSS. It does a few other things, too. You'll want to open it up and make some adjustments for your setup if you use it.
- `deploy.sh` is not something you'll need. For the maintainer (that's me &mdash; Alex), it's for making sure the code that's on github matches the code being served up when somebody goes to maitria.com. It pushes and uploads to the server.
- `mdpreview.sh` hardly counts. It's a tiny script I created to make it easy to preview this README before pushing. You'll probably have to edit it.i

###contributing
Contributions are welcome, and we are friendly. 
Fork, make your changes, and submit a pull request. And thanks!
