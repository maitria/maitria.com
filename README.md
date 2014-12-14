#maitira.com

##technology

-html
-sass
-some bash scripts (see below)

As of now, December 2014, that's is. I imagine it will change soon. :D

##attention newbies and beginners!

We'd love a contribution from you. Correct a typo, or create some cool functionality (after you've checked that we want cool functionality). If you're a newbie, you might not know how to get started contributing. Here are a couple of ideas.

First, there's a github document that talks about making pull requests. (They talk about the "Fork and Pull" model; that's what we'll use here. That document is at [Using Pull Requests](https://help.github.com/articles/using-pull-requests/) There's also a link there that talks about how to fork a repo: [Fork a Repo](https://help.github.com/articles/fork-a-repo/)

Second, and more importantly, if you are new to the whole open-source, forking repos, pull requests, even coding thing, but you think you can do the edits to fix a typo or whatever, _get in touch with us_ and if we can work the timing out, we'll talk you through it, walk you through it, or remote-pair or something. We'd love that.

##making changes

Fork, make your changes, and submit a pull request. And thanks!

##the bash scripts

There are two bash scripts.
-`smoketest.sh` is mostly about compiling SASS to CSS. It does a few other things, too. You'll want to open it up and make some adjustments for your setup if you use it.
-`deploy.sh` is not something you'll need. For the maintainer (that's me), it's for making sure the code that's on github matches the code being served up when somebody goes to maitria.com. It pushes and uploads to the server.
