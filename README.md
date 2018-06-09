dots
============

## Motivation

Setting up a new developer machine can be an **ad-hoc, manual, and time-consuming** process.  `dots` aims to **simplify** the process with **easy-to-understand instructions** and **dotfiles/scripts** to **automate the setup** of the following:

* **Linux system tools**: neofetch, tree, htop, etc
* **Developer tools**: Spacemacs, Vim, bash, tab completion, curl, git, GNU core utils, etc
* **Languages**: Python, Rust, Haskell, Scheme, etc
* **Cloud services**: Amazon Web Services and Heroku
* **Big data, AI/ML**: Apache Spark, MapReduce, etc
* **Common data stores**: PostgreSQL, Redis, and Elasticsearch
* **Javascript web development**: Node.js, ESLint, etc

### But...I Don't Need All These Tools!

**`dots` is geared to be more of an organized *reference* of various developer tools.**

**You're *not* meant to install everything.**

If you're interested in automation, `dots` provides a customizable [setup script](#single-setup-script).  There's really no one-size-fits-all solution for developers so you're encouraged to make tweaks to suit your needs.

[Credits](#credits): This repo builds on the awesome work from [Donne Martin](https://github.com/donnemartin), [Mathias Bynens](https://github.com/mathiasbynens) and [Nicolas Hery](https://github.com/nicolashery).

### Sections Summary
* Section 1 contains the dotfiles/scripts and instructions to set up your system.
* Sections 2 through 7 detail more information about installation, configuration, and usage for topics in Section 1.

## Section 1: Installation

**Scripts tested on Ubuntu 18.04 (can be ported using brew for OSX with minimal effort)**

* [Single Setup Script](#single-setup-script)
* [bootstrap.sh script](#bootstrapsh-script)
    * Syncs dots to your local home directory `~`
* [linuxprep.sh script](#linuxprepsh-script)
    * Sets up Linux (Ubuntu 18.04+) environment
* [coreapps.sh script](#coreappssh-script)
    * Sets up core applications for development and general usage
* [pydev.sh script](#pydevsh-script)
    * Sets up comprehensive, modern Python development toolchain
* [nodedev.sh script](#nodedevsh-script)
    * Sets up modern and minimal Node.js development toolchain
* [misclang.sh script](#misclangsh-script)
    * Sets up additional programming languages and their dev environments
* [datastores.sh script](#datastoressh-script)
    * Sets up common data stores

## Section 2: General Apps and Tools

* [Spotify](#spotify)
* [Terminal Customization](#terminal-customization)
* [Vim](#vim)
* [Git](#git)

## Section 3: Python development

* [Python](#python)
* [Pipenv](#pipenv)

## Section 4: Node.js Development

* [Node.js](#nodejs)
* [ESLint](#eslint)

## Section 5: Additional languages

* [Rust](#rust)
* [Haskell](#haskell)
* [Java](#java)
* [Clojure](#clojure)
* [Scheme](#scheme)
* [Common Lisp](#common-lisp)
* [Ruby](#ruby)

## Section 6: Big Data, AWS, and Heroku

* [Spark](#spark)
* [MapReduce](#mapreduce)
* [Awesome AWS](#awesome-aws-)
* [AWS Account](#aws-account)
* [AWS CLI](#aws-cli)
* [SAWS](#saws)
* [Boto](#boto)
* [S3cmd](#s3cmd)
* [S3DistCp](#s3distcp)
* [S3-parallel-put](#s3-parallel-put)
* [Redshift](#redshift)
* [Kinesis](#kinesis)
* [Lambda](#lambda)
* [AWS Machine Learning](#aws-machine-learning)
* [Heroku](#heroku)

## Section 7: Data Stores

* [PostgresQL](#postgresql)
* [Redis](#redis)
* [Elasticsearch](#elasticsearch)

## Section 8: Misc

* [Credits](#credits)
* [License](#license)

## Section 1: Installation

### Single Setup Script

#### Running with Git

##### Clone the Repo

    $ git clone https://github.com/bashhack/dots.git && cd dots

##### Run the .dots Script with Command Line Arguments

**Since you probably don't want to install every section**, the `.dots` script supports command line arguments to run only specified sections.  Simply pass in the [scripts](#scripts) that you want to install.  Below are some examples.

**For more customization, you can [clone](#clone-the-repo) or [fork](https://github.com/bashhack/dots/fork) the repo and tweak the `.dots` script and its associated components to suit your needs.**

Run all:

    $ ./.dots all

Example of cherry picking packages on your needs:

    $ ./.dots bootstrap linuxprep aws nodedev

#### Running without Git

    $ curl -O https://raw.githubusercontent.com/bashhack/dots/master/.dots && ./.dots [Add ARGS Here]

#### Scripts

* [.dots](https://github.com/bashhack/dots/blob/master/.dots)
    * Runs specified scripts
* [bootstrap.sh](https://github.com/bashhack/dots/blob/master/bootstrap.sh)
    * Syncs dots to your local home directory `~`
* [linuxprep.sh](https://github.com/bashhack/dots/blob/master/linuxprep.sh)
    * Sets up Linux (Ubuntu 18.04+) environment
* [coreapps.sh script](https://github.com/bashhack/dots/blob/master/coreapps.sh)
    * Sets up core applications for development and general usage
* [pydev.sh](https://github.com/bashhack/dots/blob/master/pydev.sh)
    * Sets up comprehensive, modern Python development toolchain
* [nodedev.sh script](https://github.com/bashhack/dots/blob/master/nodedev.sh)
    * Sets up modern and minimal Node.js development toolchain
* [misclang.sh script](https://github.com/bashhack/dots/blob/master/misclang.sh)
    * Sets up additional programming languages and their dev environments
* [aws.sh](https://github.com/bashhack/dots/blob/master/aws.sh)
    * Sets up Spark, Hadoop MapReduce, and Amazon Web Services
* [datastores.sh](https://github.com/bashhack/dots/blob/master/datastores.sh)
    * Sets up common data stores

**Notes:**

* `.dots` will initially prompt you to enter your password.
* `.dots` might ask you to re-enter your password at certain stages of the installation.
* **When `.dots` completes, be sure to restart your computer for all updates to take effect.**

The following discussions describe in greater detail what is executed when running the [.dots](https://github.com/bashhack/dots/blob/master/.dots) script.

### bootstrap.sh script

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/commands.png">
  <br/>
</p>

The `bootstrap.sh` script will sync the `dots` repo to your local home directory.  This will include customizations for Spacemacs, Vim, bash, curl, git, tab completion, aliases, a number of utility functions, etc.  Section 2 of this repo describes some of the customizations.

#### Running with Git

First, fork or [clone the repo](#clone-the-repo).  The `bootstrap.sh` script will pull in the latest version and copy the files to your home folder `~`:

    $ source bootstrap.sh

To update later on, just run that command again.

#### Optional: Add Custom Commands

If `~/.extras` exists, it will be sourced along with the other files. You can use this to add a few custom commands without the need to fork this entire repository, or to add commands you don’t want to commit to a public repository.

My `~/.extras` looks something like this:

```bash
# Git credentials
GIT_AUTHOR_NAME="bashhack (Marc Laughton)"
GIT_COMMITTER_NAME="$GIT_AUTHOR_NAME"
git config --global user.name "$GIT_AUTHOR_NAME"
GIT_AUTHOR_EMAIL="info@marclaughton.com"
GIT_COMMITTER_EMAIL="$GIT_AUTHOR_EMAIL"
git config --global user.email "$GIT_AUTHOR_EMAIL"
```

You could also use `~/.extras` to override settings, functions, and aliases from the dots repository, although it’s probably better to [fork the dots repository](https://github.com/bashhack/dots/fork).

### linuxprep.sh script

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/tux.jpg">
  <br/>
</p>

Run the `linuxprep.sh` script:

    $ ./linuxprep.sh

`linuxprep.sh` will first install all updates. Next, essential system and hardware utilities are installed.

### coreapps.sh script

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/apps.png">
  <br/>
</p>

Some of the apps installed by the `coreapps.sh` script include: Chromium, Spotify, fonts, system monitoring, Emacs, Vim, search tools (i.e., SilverSearcher, RipGrep), etc.

Run the `coreapps.sh` script:

    $ ./coreapps.sh

### pydev.sh script

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/python.png">
  <br/>
</p>

This will install [pyenv](#pyenv) and [pipenv](#pipenv).  It will then set up two virtual environments loaded with the packages you will need to work with data in Python 2 and Python 3.

To switch to the Python 2 virtual environment, run the following `pyenv` command:

    $ pyenv local 2.7

To switch to the Python 3 virtual environment, run the following `pyenv` command:

    $ pyenv local 3.6.5

When run without a version number, pyenv local reports the currently configured local version. You can also unset the local version:

    $ pyenv local --unset

Sets the global version of Python to be used in all shells by writing the version name to the ~/.pyenv/version file. This version can be overridden by an application-specific .python-version file, or by setting the PYENV_VERSION environment variable.

    $ pyenv global 3.7-dev

Sets a shell-specific Python version by setting the PYENV_VERSION environment variable in your shell. This version overrides application-specific versions and the global version.

    $ pyenv shell 3.8-dev

When run without a version number, pyenv shell reports the current value of PYENV_VERSION. You can also unset the shell version:

    $ pyenv shell --unset

Note that you'll need pyenv's shell integration enabled (step 3 of the installation instructions) in order to use this command. If you prefer not to use shell integration, you may simply set the PYENV_VERSION variable yourself:

    $ export PYENV_VERSION=3.8-dev

[Section 3: Python Development Packages](#section-3-python-development-packages) describes the installed packages and usage.

### nodedev.sh script

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/nodejs.png">
  <br/>
</p>

To set up a JavaScript web development environment, Run the `nodedev.sh` script:

    $ ./nodedev.sh

[Section 4: JavaScript Development Packages](#section-6-javascript-development-packages) describes the installed packages and usage.

## Section 2: General Apps and Tools
