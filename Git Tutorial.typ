#set heading(numbering: "1.")

= Preface

This tutorial is a slimmed-down version of a git tutorial. If you need a more
in-depth tutorial, google it.

Please read every line carefully, and don't skip any steps.

== How to Read this Tutorial

- Optional steps are indicated with (Optional) at the front of the header line.

- User input is indicated with \<angle brackets\>. For example, if I wanted you
  to input your name, I would write:

```bash
some command "<your name>"
```

- Note that the quotes are mandatory wherever you see them.
- Coloured text should be inputted into your terminal exactly as shown, except
  for the specified inputs.

== Notes for Windows Users

- Use *PowerShell*
- Forward slashes and backslashes are interchangeable

= Git, from Scratch

== Install Git on:

=== MacOS:

Some versions of MacOS come with git preinstalled. Check with:

```bash
git --version
```

If you get an error, you need to install git. You can do this with:

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
```

=== Windows:

You can install git for Windows from here:
https://git-scm.com/download/win

=== Linux:

If you're on Linux, you already have git installed. Check with:

```bash
git --version
```

If you get an error, you need to install git. Since you're on Linux, you can
figure this out yourself. Hint: Google "install git on \<distro\> linux"

== Setting up Git, locally

```bash
git config --global user.name "<your name>"
git config --global user.email "<your email>"
ssh-keygen -t ed25519 -C "<your email>"
```

= GitHub

== Creating a GitHub Account

Go to https://github.com/join. Use your *personal email address*.

Fill in the form, and you're done. They'll probably send you an email asking you
for verification or something.

== Creating a GitHub Repository

=== Side Track: Create a Directory for your Code

The first thing you'll need to do is standardize where you store your code. You
may choose any directory on your computer, but I recommend you create it in your
Documents directory under `~/Documents/code`.

==== MacOS:

```bash
cd
mkdir -p Documents/code
```

==== Windows:

```bash
cd
mkdir Documents\code
```

==== Linux:

```bash
cd
mkdir -p Documents/code
```

=== Creating the Repository

Go to https://github.com/new. You'll see a form like this:

#image("Create Repo.png", height: 40%)

Fill it in, then click "Create repository". Hint: It's at the bottom of the 
page, and it's *very green*.

=== Setting up the Repository on your Computer

Copy the URL of your repository. It'll look something like this:

#image("GitHub Repo Setup.png", height: 40%)

Next, go to your terminal and run:

```bash
cd ~/Documents/code # or wherever you want to store your code
git clone <URL>
ls # this should show you all the files in your current directory
cd <repo name>
```

=== Making your first commit

Now that you have the repository set up, you can make your first commit. This
part is kind of important, so I'll explain it in detail.

First, make sure you're in the directory of your repository. You can do this by
running

```bash
git rev-parse --is-inside-work-tree
```

If you're not in a repository, you'll get an error. If it doesn't say error,
you're in a repository.

Next, you'll create a file in your repository.
```bash
echo "# test" >> README.md
```

You can check if it's there by running:
```bash
ls
```

Now, you can add your file to the staging area. This indicates to git that you
want to commit this file *at the current revision*: if you make more changes to
this file after you've added it to the staging area, *you'll need to add it
again*.

```bash
git status
git add README.md
git status
```

#image("Committing.png")

Notice how the first `git status` showed README.md was #text(fill: red)[red],
which indicates that it's *not staged*. The second `git status` showed it was
#text(fill: green)[green], which indicates that it's *staged*.

You then need to commit your changes. This is like saving your changes to git.
The syntax for the commit command is `git commit -m "<message>"`. The `-m` flag
indicates that you're going to give a message to describe the changes you made.
```bash
git commit -m "first commit"
```

And you can push it to GitHub with:
```bash
git push
```

=== Branches

Branches are how you work with multiple people on the same project. You can
create a branch (and switch to it at the same time) with:
```bash
git checkout -b <branch name>
```

The checkout command is how you switch between branches. You can switch back to
the main branch with:
```bash
git checkout main
```

You can list all the branches with:
```bash
git branch -a
```

=== Recap

==== Important Commands

- `git status`: shows the status of your repository
- `git add`: adds a file to the staging area
- `git commit`: commits the changes in the staging area
- `git push`: pushes your changes to GitHub
- `git pull`: pulls changes from GitHub
- `git log`: shows the commit history
- `git diff`: shows the changes between commits
- `git checkout <branch>`: switches to a branch
- `git branch -a`: lists all branches

==== Simple Git Workflow

Every time you want to make changes, especially when you're working with a team,
you can follow this workflow:
+ `git checkout main` --- Switch to main branch
+ `git pull` --- Pull other's changes
+ `git checkout -b <branch name>` --- Create a new branch
+ Make changes
+ `git add -A` --- Add all changes to staging area
+ `git commit -m "<message>"` --- Commit changes
+ `git push` --- Push changes to GitHub
