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
* **Javascript development**: Node.js, ESLint, etc

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
    * Sets up modern and minimal JavaScript development toolchain
* [misclang.sh script](#misclangsh-script)
    * Sets up additional programming languages and their dev environments
* [aws.sh script](#awssh-script)
    * Sets up Spark, Hadoop MapReduce, and Amazon Web Services
* [datastores.sh script](#datastoressh-script)
    * Sets up common data stores

## Section 2: General Apps and Tools

* [Spotify](#spotify)
* [Terminal Customization](#terminal-customization)
* [Vim](#vim)
* [Git](#git)

## Section 3: Python Development

* [Python](#python)
* [Pipenv](#pipenv)

## Section 4: JavaScript Development

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
    * Sets up modern and minimal JavaScript development toolchain
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

This will install [pyenv](#pyenv), [pipenv](#pipenv) and associated packages.  It will then set up two virtual environments loaded with the packages you will need to work with data in Python 2 and Python 3.

Run the `pydev.sh` script:

    $ ./pydev.sh

[Section 3: Python Development](#section-3-python-development) describes the installed packages and usage.

### nodedev.sh script

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/nodejs.png">
  <br/>
</p>

To set up a JavaScript web development environment, Run the `nodedev.sh` script:

    $ ./nodedev.sh

[Section 4: JavaScript Development](#section-4-javascript-development) describes the installed packages and usage.

### misclang.sh script

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/misclangs.png">
  <br/>
</p>

To set up a development environment to work additional languages (including Rust, Scheme, Clojure, Haskell, etc.), run the `misclang.sh` script:

    $ ./misclang.sh

[Section 5: Additional Languages](#section-5-additional-languages) describes the installed packages and usage.

### aws.sh script

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/aws.png">
  <br/>
</p>

To set up a development environment to work with Spark, Hadoop MapReduce, and Amazon Web Services, run the `aws.sh` script:

    $ ./aws.sh

[Section 6: Big Data, AWS, and Heroku](#section-6-big-data-aws-and-heroku) describes the installed packages and usage.

### datastores.sh script

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/datastores.png">
  <br/>
</p>

To set up common data stores, run the `datastores.sh` script:

    $ ./datastores.sh

[Section 7: Data Stores](#section-7-data-stores) describes the installed packages and usage.

## Section 2: General Apps and Tools

### Git

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/git.png">
  <br/>
</p>

What's a developer without [Git](http://git-scm.com/)?

#### Installation

Git should have been installed when you ran through the [linuxprep.sh script](#linuxprepsh-script).

#### Configuration

To check your version of Git, run the following command:

    $ git --version

And `$ which git` should output `/usr/bin/git`.

Let's set up some basic configuration. Download the [.gitconfig](https://raw.githubusercontent.com/bashhack/dots/master/.gitconfig) file to your home directory:

    $ cd ~
    $ curl -O https://raw.githubusercontent.com/bashhack/dots/master/.gitconfig

It will add some color to the `status`, `branch`, and `diff` Git commands, as well as a couple aliases. Feel free to take a look at the contents of the file, and add to it to your liking.

Next, we'll define your Git user (should be the same name and email you use for [GitHub](https://github.com/) and [Heroku](http://www.heroku.com/)):

    $ git config --global user.name "Your Name Here"
    $ git config --global user.email "your_email@youremail.com"

They will get added to your `.gitconfig` file.

To push code to your GitHub repositories, we're going to make use of [Krypton](https://krypt.co/), so you don't have to type your username and password everytime. Using this service, we also easily manage one set of credentials across multiple dev machines. Installation of Krypton occurs in the [linuxprep.sh script](#linuxprepsh-script), and does require additional setup via the `kr pair` command. Please ensure you have a mobile device with the Krypton app installed before configuration.

### Tmux

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/tmux.png">
  <br/>
</p>

### Build Tools

### Terminal Customization

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/terminal.png">
  <br/>
</p>

Since we spend so much time in the terminal, we should try to make it a more pleasant and colorful place.

#### Configuration

The [bootstrap.sh script](#bootstrapsh-script) contains terminal customizations.

### Vim

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/vim.png">
  <br/>
</p>

Although Emacs is our main editor, some basic [Vim](http://www.vim.org/) configuration when you need it goes a long way .

#### Installation

The [linuxprep.sh script](#linuxprepsh-script) will install `vim`.

#### Configuration

The [bootstrap.sh script](#bootstrapsh-script) contains Vim customizations.

### Emacs

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/emacs.png">
  <br/>
</p>

#### Installation

The [linuxprep.sh script](#linuxprepsh-script) will install `emacs`.

#### Configuration

The [bootstrap.sh script](#bootstrapsh-script) contains Emacs customizations.

Notably, `dots` favors utilization of [Spacemacs](http://spacemacs.org/) for customization of Emacs. After years of homebrewing Emacs configs, a "set it and forget it" approach can be refreshing. For more info on the layers (or packages) installed, please see the [.spacemacs](https://raw.githubusercontent.com/bashhack/dots/master/.spacemacs) file.

### AG (Silver Searcher)

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/silversearcher.png">
  <br/>
</p>

#### Installation

The [linuxprep.sh script](#linuxprepsh-script) will install `ag`.

#### Configuration

No additional setup required, it's like `ack` but much faster and written in C. Under the hood, it uses `Pthreads` enabling multi-processing (i.e., using multiple CPU cores).

### RipGrep

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/ripgrep.png">
  <br/>
</p>

#### Installation

The [linuxprep.sh script](#linuxprepsh-script) will install `rg`.

#### Configuration

No additional setup required - it's a hybrid between `ag` (`ack` clone) with GNU `grep`, faster then either and written in Rust.

#### Usage

Examples of basic operations are shown below.

To recursively search the current directory, while respecting `.gitignore` files, hidden files, and binary files:

    $ rg foobar

To ignore all ignore files, use `-u`. To additionally search hidden files and directories, use `-uu`. To additionally search binary files, use `-uuu`.
In particular, `rg -uuu` is similar to `grep -a -r`.

    $ rg -uu foobar
    $ rg -uuu foobar

Search only files matching a particular glob:

    $ rg foo -g 'README.*'

Or, exclude files matching a particular glob:

    $ rg foo -g '!*.min.js'

Search only HTML and CSS files:

    $ rg -thtml -tcss foobar

Search everything except JavaScript files:

    $ rg -Tjs foobar

### Neofetch

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/neofetch.png">
  <br/>
</p>

Highly configurable shell bling to display system info - in other words, a better `screenfetch`.

To disable `neofetch` on terminal startup, simply comment out `neofetch` from [.extras](https://raw.githubusercontent.com/bashhack/dots/master/.extras).

### Tree

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/tree.png">
  <br/>
</p>

A recursive directory listing program for Unix systems, outputting a depth-indented listing of files.

#### Installation

The [linuxprep.sh script](#linuxprepsh-script) will install `tree`.

#### Usage

Use `tree` to output all visible files and directories, and `tree -a` to include hidden file content.

### HTOP

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/htop.png">
  <br/>
</p>

A simple, interactive system monitor for process viewing and management.

#### Installation

The [linuxprep.sh script](#linuxprepsh-script) will install `tree`.

#### Usage

Evoke using `htop` command.

### Fonts

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/fonts.png">
  <br/>
</p>

While I don't have a need for much font customization, I do find [Source Code Pro](https://adobe-fonts.github.io/source-code-pro/) quite visually appealing and works especially well with Spacemacs.

Additionally, I tend to rely on the mega font pack [Nerd Fonts](https://nerdfonts.com/) for supporting certain features in Spacemacs, Vim, and tmux, as well as general system typography and iconograpy.

### Chromium

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/chromium.png">
  <br/>
</p>

Firefox is the default on Ubuntu 18.04, but installation of Chromium is useful for debugging and additional browser features.

### Spotify

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/spotify.png">
  <br/>
</p>

Essential listening.
Feel free to follow me [here](https://open.spotify.com/user/laughtonm?si=6TXPoQ09TEmT9h_A-k7_XQ).

## Section 3: Python Development

### Pyenv

[pyenv](https://github.com/pyenv/pyenv) is used to manage multiple versions of Python on the system without modification of the system Python 2 or Python 3 installations.

#### Usage

To switch to the Python 2 virtual environment, run the following `pyenv` command:

    $ pyenv local 2.7

To switch to the Python 3 virtual environment, run the following `pyenv` command:

    $ pyenv local 3.6.5

When run without a version number, `pyenv local` reports the currently configured local version. You can also unset the local version:

    $ pyenv local --unset

Sets the global version of Python to be used in all shells by writing the version name to the `~/.pyenv/version` file. This version can be overridden by an application-specific `.python-version` file, or by setting the `PYENV_VERSION` environment variable.

    $ pyenv global 3.7-dev

Sets a shell-specific Python version by setting the `PYENV_VERSION` environment variable in your shell. This version overrides application-specific versions and the global version.

    $ pyenv shell 3.8-dev

When run without a version number, pyenv shell reports the current value of `PYENV_VERSION`. You can also unset the shell version:

    $ pyenv shell --unset

Note that you'll need pyenv's shell integration enabled (step 3 of the installation instructions) in order to use this command. If you prefer not to use shell integration, you may simply set the `PYENV_VERSION` variable yourself:

    $ export PYENV_VERSION=3.8-dev

### Pipenv

[pipenv](https://github.com/pypa/pipenv) by [Kenneth Reitz](https://github.com/kennethreitz) is used for managing the core of the Python development workflows on the system.

#### Usage

Combining the benefits of `pip` and `virtualenv`, basic utilization of `pipenv` is simple and intuitive.

To create a new project using a specific version of Python:

    $ pipenv --python 3.6

To install all dependencies (including dev):

    $ pipenv install --dev

Show a graph of installed dependencies:

    $ pipenv graph

To install a local `setup.py`:

    $ pipenv install -e

To spawn a shell with virtual environment activated:

    $ pipenv shell

Deactivate virtual environment:

    $ exit

### Pipsi

[Coming Soon]

### Jupyter Notebook

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/jupyter.png">
  <br/>
</p>

A language-agnostic HTML notebook application for Project Jupyter. Comprising of a web application and notebook documents, [Jupyter Notebook](https://jupyter-notebook.readthedocs.io/en/stable/index.html) provides a computing environment that can be used for developing, documenting, and executing code, as well as communicating the results.

#### Installation

Both the Jupyter Notebook and the [Calysto Hy](https://github.com/Calysto/calysto_hy) kernel (for Hy language development) are installed in `pydev.sh`.

#### Usage

For console-based development:

    $ jupyter console  # default python3
    $ jupyter console --kernel calysto_hy

For notebook-based development:

    $ jupyter notebook  # default python3
    $ jupyter notebook  # change kernel in notebook

### NumPy

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/numpy.png">
  <br/>
</p>

NumPy adds Python support for large, multi-dimensional arrays and matrices, along with a large library of high-level mathematical functions to operate on these arrays.

#### Installation

The [pydev.sh script](#pydevsh-script) installs NumPy.  If you prefer to install it separately, run:

    $ pip install numpy

#### Usage

Refer to the following [Python Data Science Handbook](https://github.com/jakevdp/PythonDataScienceHandbook/blob/master/notebooks/02.00-Introduction-to-NumPy.ipynb) by Jake VanderPlas.

### Pandas

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/pandas.png">
  <br/>
</p>

Pandas is a software library written for data manipulation and analysis in Python. Offers data structures and operations for manipulating numerical tables and time series.

#### Installation

The [pydev.sh script](#pydevsh-script) installs Pandas.  If you prefer to install it separately, run:

    $ pip install pandas

#### Usage

Refer to the following [Python Data Science Handbook](https://github.com/jakevdp/PythonDataScienceHandbook/blob/46cfb1c8b28edcdf543b4aabd59c0d5b7202236b/notebooks/03.00-Introduction-to-Pandas.ipynb) by Jake VanderPlas.

### Matplotlib

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/matplotlib.png">
  <br/>
</p>

Matplotlib is a Python 2D plotting library which produces publication quality figures in a variety of hardcopy formats and interactive environments across platforms.

#### Installation

The [pydev.sh script](#pydevsh-script) installs matplotlib.  If you prefer to install it separately, run:

    $ pip install matplotlib

#### Usage


Refer to the following [Python Data Sciene Handbook](https://github.com/jakevdp/PythonDataScienceHandbook/blob/ccafda3da2b190f244867e9562edf3e4d6f5c883/notebooks/04.00-Introduction-To-Matplotlib.ipynb) by Jake VanderPlas.

### Seaborn

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/seaborn.png">
  <br/>
</p>

Seaborn is a Python visualization library based on matplotlib. It provides a high-level interface for drawing attractive statistical graphics.

#### Installation

The [pydev.sh script](#pydevsh-script) installs matplotlib.  If you prefer to install it separately, run:

    $ pip install seaborn

#### Usage

Refer to the following [Python Data Sciene Handbook](https://github.com/jakevdp/PythonDataScienceHandbook/blob/master/notebooks/04.14-Visualization-With-Seaborn.ipynb) by Jake VanderPlas.

### Scikit-learn

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/scikitlearn.png">
  <br/>
</p>

Scikit-learn adds Python support for efficient versions of a large number of common machine learning algorithms. It has a clean, uniform, and streamlined API, and great documentation.

#### Installation

The [pydev.sh script](#pydevsh-script) installs Scikit-learn.  If you prefer to install it separately, run:

    $ pip install scikit-learn

#### Usage

Refer to the following [Python Data Science Handbook](https://github.com/jakevdp/PythonDataScienceHandbook/blob/e3a225725cbc5c35cfcd8f4139e6a6c11d3e08b7/notebooks/05.02-Introducing-Scikit-Learn.ipynb) by Jake VanderPlas.

### SciPy

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/scipy.png">
  <br/>
</p>

SciPy is a collection of mathematical algorithms and convenience functions built on the Numpy extension of Python. It adds significant power to the interactive Python session by providing the user with high-level commands and classes for manipulating and visualizing data.

#### Installation

The [pydev.sh script](#pydevsh-script) installs SciPy.  If you prefer to install it separately, run:

    $ pip install scipy

#### Usage

Refer to the following for information and examples: [SciPy Documentation](https://docs.scipy.org/doc/scipy/reference/)

### Bokeh

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/bokeh.png">
  <br/>
</p>

Bokeh is a Python interactive visualization library that targets modern web browsers for presentation. Its goal is to provide elegant, concise construction of novel graphics in the style of D3.js, but also deliver this capability with high-performance interactivity over very large or streaming datasets. Bokeh can help anyone who would like to quickly and easily create interactive plots, dashboards, and data applications.

#### Installation

The [pydev.sh script](#pydevsh-script) installs Bokeh.  If you prefer to install it separately, run:

    $ pip install bokeh

#### Usage

Refer to the following [Bokeh User Guide](https://bokeh.pydata.org/en/latest/docs/user_guide.html#userguide).

## Section 4: JavaScript Development

NOTE:
While globally installing packages was commonplace within the JavaScript community for years, this has (thankfully) fallen out of favor for the most part.
Here, the only two globally installed packages are those used by Emacs for code quality, inspection, and completion.
I do not install any JavaScript build tooling globally, and do not recommend doing so.

### NVM

Using `nvm`, like `pyenv`, allows us to effectively manage multiple active node.js versions.

#### Installation

The [nodedev.sh script](#nodedevsh.script) installs [Node.js](https://nodejs.org/en/) and [NPM](https://www.npmjs.com/) via [nvm](https://github.com/creationix/nvm).

#### Usage

To install Node (with its corresponding NPM version):

    $ nvm install node  # installs the latest Node
    $ nvm install 9.4  # installs Node at specified version (i.e., 9.4, 10.2, etc)

To uninstall a Node version:

    $ nvm uninstall 9.4

To specify a default Node version to be used in any new shell:

    $ nvm alias default 9.4

To see all installed versions:

    $ nvm ls  # see local
    $ nvm ls-remote  # see remote

In any directory, setting a version in a `.nvmrc` file and running `nvm use` will override the global default.

### Tern

### ESLint


## Section 5: Additional Languages

## Section 6: Big Data, AWS, and Heroku

## Section 7: Data Stores

## Section 8: Misc

### Credits

See the [Credits Page](https://github.com/bashhack/dots/blob/master/CREDITS.md).

### License

This repository contains a variety of content; some developed by bashhack (Marc Laughton), and some from third-parties.
The third-party content is distributed under the license provided by those parties.

The content developed by bashhack (Marc Laughton) is distributed under the following license:

    Copyright 2018 bashhack (Marc Laughton)

    Permission is hereby granted, free of charge, to any person obtaining a copy of this software and 
    associated documentation files (the "Software"), to deal in the Software without restriction, 
    including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, 
    and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, 
    subject to the following conditions:

    The above copyright notice and this permission notice shall be included in all copies 
    or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
    INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR 
    PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE 
    FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, 
    ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
