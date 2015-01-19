#maitira.com

## What is it?

It's the website for [maitria.com](maitria.com). It started just html & css. Duplication meant it was time to add some Clojure fun. In the future it will probably have a blog engine, and who knows what else. And it's definitely a place for learning.

## Why is our website open source? 

- openness
- to add to beginner-friendly open source possibilities
- we like making friends
- we might need help sometime 
- you might want to use it
- we might learn from you

##technology

- html
- sass
- some bash scripts (see below)
- clostache (a mustache like thing)

##attention newbies and beginners!

We'd love a contribution from you. If you're learning SASS, help us reduce duplication. Or correct a typo, or create some cool functionality (after you've checked that we want cool functionality). If you're a newbie, you might not know how to get started contributing. Here are a couple of ideas.

First, there's a github document that talks about making pull requests. (They talk about the "Fork and Pull" model; that's what we'll use here. That document is at [Using Pull Requests](https://help.github.com/articles/using-pull-requests/) There's also a link there that talks about how to fork a repo: [Fork a Repo](https://help.github.com/articles/fork-a-repo/)

Second, and more importantly, if you are new to the whole open-source, forking repos, pull requests, even coding thing, but you think you can do the edits to fix a typo or whatever, *get in touch with us* and if we can work the timing out, we'll talk you through it, walk you through it, or remote-pair or something. We'd love that.

### Note

This README isn't as beginner-friendly as we'd like. That's entirely because Alex is a beginner, too, and is mainly responsible for this site. (As I learn more, I'll improve it. Feel free to improve it if you like, as well. Anybody want to learn Clojure web dev with me? :D &mdash; Alex) 

##making changes

Fork, make your changes, and submit a pull request. And thanks!

##the bash scripts

There are two bash scripts.
- `generate.sh` generates the .html from .html.mustache and compiles SASS to CSS. It does a few other things, too. You'll want to open it up and make some adjustments for your setup if you use it.
- `deploy.sh` is not something you'll need. For the maintainer (that's me &mdash; Alex), it's for making sure the code that's on github matches the code being served up when somebody goes to maitria.com. It pushes and uploads to the server.
