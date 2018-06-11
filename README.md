dots
=====

Setting up a new development machine can be a frustrating experience - manual, laborious, and fraught with inefficiency. These setup scripts aim to simplify and automate the process, configuring my development environment with the tools I use in my professional and personal work:

* **Linux system tools**: neofetch, tree, htop, etc
* **Developer tools**: Spacemacs, Vim, bash, tab completion, curl, git, GNU core utils, etc
* **Languages**: Python, Rust, Haskell, Scheme, etc
* **Cloud services**: Amazon Web Services and Heroku
* **Big data, AI/ML**: Apache Spark, Sci-Kit Learn, MapReduce, etc
* **Common data stores**: PostgreSQL, Redis, and Elasticsearch

**`dots` is geared to be more of an organized *reference* of various developer tools.**

If you're interested in automation, `dots` provides a customizable [setup script](#single-setup-script). Tweak and adjust, as needed.

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
* [AWS Account](#aws-account)
* [AWS CLI](#aws-cli)
* [Boto](#boto)
* [S3cmd](#s3cmd)
* [Redshift](#redshift)
* [Kinesis](#kinesis)
* [Lambda](#lambda)
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
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/tux.png">
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

### Python Language Server

[Coming Soon]

### Jupyter Notebook

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/jupyter.png">
  <br/>
</p>

A language-agnostic HTML notebook application for Project Jupyter. Comprising of a web application and notebook documents, [Jupyter Notebook](https://jupyter-notebook.readthedocs.io/en/stable/index.html) provides a computing environment that can be used for developing, documenting, and executing code, as well as communicating the results.

#### Installation

Both the Jupyter Notebook and the [Calysto Hy](https://github.com/Calysto/calysto_hy) kernel (for Hy language development) are installed in `pydev.sh`.

If you prefer to intsall them separately, run:

    $ pip install git+https://github.com/Calysto/calysto_hy.git
    $ python -m calysto_hy install

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

A code-analysis engine for JavaScript. Many code editors can utilize its features:

  - Autocompletion on variables and properties
  - Function argument hints
  - Querying the type of an expression
  - Finding the definition of something
  - Automatic refactoring

For more information, see the official [Tern Reference Manual](http://ternjs.net/doc/manual.html).

#### Configuration

The [bootstrap.sh script](#bootstrapsh-script) installs a basic `.tern-project` configuration file. For editing and options, please refer to Tern's documentation.

### ESLint

Friends don't let friends go without a robust and flexible linting solution. Just like our python development environment includes a suite of code-quality tools, we have included ESLint here to ensure that JavaScript code written on the system conforms to best-practice.

#### Configuration

I opt for a strict [ESLint](https://eslint.org/) configuration that enforces key functional programming paradigms and methodologies. Many find that Airbnb has a suitable config for their needs, but I encourage you to explore what works for you. The [bootstrap.sh script](#bootstrapsh-script) installs the `.eslintrc` used to set the ESLint config, should you need to make changes do so there.

For more info on the config I use, see [eslint-config-cleanjs](https://github.com/bodil/eslint-config-cleanjs).

## Section 5: Additional Languages

### Rust

#### Installation

[Rust](https://www.rust-lang.org/en-US/) is installed by [misclang.sh script](#misclangsh-script).

#### Usage

To access documentation:

    $ rustup doc

To update Rust:

    $ rustup update

For basic one-off compiling (a la `gcc` or `clang`):

    $ rustc main.rs

The heart of the Rust toolchain is [Cargo](https://doc.rust-lang.org/cargo/getting-started/first-steps.html). For most projects, we won't be directly compiling via `rustc`, but will instead using Cargo to build, manage, and test our code and its dependencies.

To create a new project:

    $ cargo new project_name --bin  # or --lib

To compile and run the newly created project:

    $ cargo build
    $ ./target/debug/project_name

Or, we can use the `run` command to both compile and run in a single command:

    $ cargo run

To create a release build:

    $ cargo build --release  # will put binary in target/release instead of target/debug

### Haskell

#### Installation

[Haskell](https://downloads.haskell.org/~ghc/latest/docs/html/users_guide/) is installed by [misclang.sh script](#misclangsh-script).

Haskell is installed via [Stack](https://docs.haskellstack.org/en/stable/README/), the defacto build tool and environment manager on this system and within the community at large.

#### Usage

To create a new project directory:

    $ stack new project-name

Within the newly created project directory, we can install the GHC:

    $ stack setup

To build the minimal project:

    $ stack build

To execute the command:

    $ stack exec my-project-exe

To launch a REPL:

    $ stack ghci

### Java

#### Installation

[Java 8](https://docs.oracle.com/javase/8/docs/api/index.html) is installed by [misclang.sh script](#misclangsh-script).

#### Usage

Start a Clojure REPL....

But seriously, we have this installed because Clojure targets the JVM, as does Lucene (i.e., search library used by Elasticsearch).

### Clojure

#### Installation

[Clojure](https://clojure.github.io/clojure/) is installed by [misclang.sh script](#misclangsh-script).

Clojure is installed via [Leiningen](https://leiningen.org/), the defacto build tool and environment manager on this system and within the community at large.

#### Usage

NOTE: I use Leiningen over Boot for a host of reasons, but should Boot be your thing - see the [Boot Wiki](https://github.com/boot-clj/boot/wiki).

To create a new project:

    $ lein new app my-project  # omit app if building a library

Edit project dependencies in `project.clj`, as needed.

To launch a REPL:

    $ lein repl

To execute the program:

    $ lein run

For long-running processes, we can save memory by exiting the Leiningen JVM before launching our project's JVM:

    $ lein trampoline run

To run tests:

    $ lein test

### ClojureScript

#### Installation

We need no other installation steps beyond having Clojure installed.

#### Usage

To start a new project:

    $ lein new figwheel my-project
    $ lein new figwheel my-project -- --om
    $ lein new figwheel my-project -- --reagent
    $ cd my-project
    $ lein figwheel

Open a browser, navigate to `localhost:3449`. Open the project code, edit `hello-world` in `src/hello_world/core.cljs`. Save the file, and the changes should be reflected immediately.

To add [Devcards](https://github.com/bhauman/devcards) support, add it as a dependency in `project.clj`. As an example:

    [org.clojure/clojurescript "1.10.238"]
    [devcards "0.2.5"]

### Scheme

#### Installation

[Scheme](https://cisco.github.io/ChezScheme/) is installed by [misclang.sh script](#misclangsh-script).

While many Scheme implementations are available, including Chicken, Racket, GNU Guile, etc., I opt for and recommend Chez Scheme written by [R. Kent Dybvig](https://www.cs.indiana.edu/~dyb/). For those familiar with the history of Chez Scheme - most notably, its relationship to CISCO - fear not, Chez Scheme is now open-source. No need to shell out $4000 anymore to enjoy the world's fastest Scheme implementation and what is, perhaps, the most beautiful compiler ever written.

#### Usage

To launch a REPL:

    $ scheme

For compilation and app distribution, refer to [Section 2.8. Building and Distributing Applications](https://cisco.github.io/ChezScheme/csug9.5/use.html#./use:h8).

### Common Lisp

#### Installation

[Steel Bank Common Lisp](http://www.sbcl.org/) is installed by [misclang.sh script](#misclangsh-script).

Like Scheme, there are many implementations of Common Lisp to choose from. I opt for SBCL (out of Carnegie Melon) because of its speed, type inference, debugger, and robustness for production code. I do NOT recommend this for casual use - where I would instead suggest [CCL](https://ccl.clozure.com/).

#### Usage

To launch a REPL:

    $ sbcl

For compilation and app distribution, I really like [Roswell](https://github.com/roswell/roswell) though [Buildapp](https://www.xach.com/lisp/buildapp/) is great, too!

### Ruby

#### Installation

[Ruby](https://www.ruby-lang.org/en/) is installed by [misclang.sh script](#misclangsh-script).

Ruby is installed via [rbenv](https://github.com/rbenv/rbenv), a Ruby version manager like `nvm` suitable for handling multiple active versions and any installed gems.

#### Usage

I almost never write Ruby anymore, nor do I tend to need its REPL (run `irb`, if interested). However, it is installed and used as a dependency for other system requirements (i.e., `foreman`, `gulp-sass`, etc.).

## Section 6: Big Data, AWS, and Heroku

### Spark

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/spark.png">
  <br/>
</p>

Spark is an in-memory cluster computing framework, up to 100 times faster for certain applications and is well suited for machine learning algorithms.

#### Installation

The [pydev.sh script](#pydevsh-script) installs Spark locally. If you prefer to install it separately, run:

    $ pip install pyspark

#### Usage

Run Spark locally:

    $ pyspark

For a demo, I've included a simple Jupyter notebook [pyspark notebook](#add-link-to-notebook) which, once run should finish with the result of PI.

Spark is also supported on AWS Elastic MapReduce as described [here](https://aws.amazon.com/emr/details/spark/).  To create a cluster, run the following command with the [AWS CLI](#aws-cli), replacing `myKey` with the name of your keypair to SSH into your cluster:

    $ aws emr create-cluster --name "Spark cluster" --release-label emr-5.14.0 --applications Name=Spark \
    --ec2-attributes KeyName=myKey --instance-type m4.large --instance-count 3 --use-default-roles

### MapReduce

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/mrjob.png">
  <br/>
</p>

Mrjob supports MapReduce jobs in Python, running them locally or on Hadoop clusters such as AWS Elastic MapReduce (EMR).

#### Installation

The [pydev.sh script](#pydevsh-script) installs mrjob locally. If you prefer to install it separately, run:

    $ pip install mrjob

The [aws.sh script](#awssh-script) syncs the template `.mrjob.conf` file to your home folder.  Note running the aws.sh script will overwrite any existing `~/.mrjob.conf` file.  Update the config file with your credentials, keypair, region, and S3 bucket paths:

```
runners:
  emr:
    aws_access_key_id: YOURACCESSKEY
    aws_secret_access_key: YOURSECRETKEY
    aws_region: us-east-1
    ec2_key_pair: YOURKEYPAIR
    ec2_key_pair_file: ~/.ssh/YOURKEYPAIR.pem
    ...
    s3_scratch_uri: s3://YOURBUCKETSCRATCH
    s3_log_uri: s3://YOURBUCKETLOG
    ...
```

#### Usage

NOTE: If we have a script `wordcount.py`:

```
    """The classic MapReduce job: count the frequency of words.
    """
    from mrjob.job import MRJob
    import re

    WORD_RE = re.compile(r"[\w']+")


    class MRWordFreqCount(MRJob):

        def mapper(self, _, line):
            for word in WORD_RE.findall(line):
                yield (word.lower(), 1)

        def combiner(self, word, counts):
            yield (word, sum(counts))

        def reducer(self, word, counts):
            yield (word, sum(counts))


    if __name__ == '__main__':
        MRWordFreqCount.run()
```

Using on locally:

    $ python wordcount.py my_file.txt > count_output

Using on EMR:

    $ python wordcount.py my_file.txt -r emr > count_output

### AWS Account

To start using AWS, you first need to sign up for an account.

#### Sign up for AWS

When you sign up for Amazon Web Services (AWS), your AWS account is automatically signed up for all services in AWS. You are charged only for the services that you use.  New users are eligible for 12 months of usage through the [AWS Free Tier](http://aws.amazon.com/free/).

To create an AWS account, open http://aws.amazon.com/, and then click Sign Up.  Follow the on-screen instructions.  Part of the sign-up procedure involves receiving a phone call and entering a PIN using the phone keypad.  Note your AWS account ID.

### AWS CLI

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/aws_cli.png">
  <br/>
</p>

The AWS Command Line Interface is a unified tool to manage AWS services, allowing you to control multiple AWS services from the command line and to automate them through scripts.

#### Installation

The [aws.sh script](#aws-script) installs the AWS CLI.  If you prefer to install it separately, run:

    $ pip install awscli

Run the following command to configure the AWS CLI:

    $ aws configure

Alternatively, the aws.sh script also syncs the template ```.aws/``` folder to your home folder.  Note running the aws.sh script will overwrite any existing ```~/.aws/``` folder.  Update the config file with your credentials and location:

```
[default]
region = us-east-1
```

```
[default]
aws_access_key_id = YOURACCESSKEY
aws_secret_access_key = YOURSECRETKEY
```

#### Usage

Refer to the following [AWS CLI Command Reference](https://docs.aws.amazon.com/cli/latest/index.html).

### Boto

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/boto.png">
  <br/>
</p>

Boto is the official AWS SDK for Python.

#### Installation

The [aws.sh script](#aws-script) installs boto.  If you prefer to install it separately, run:

    $ pip install boto

Boto uses the same configuration as described in the [AWS CLI](#aws-cli) section.

#### Usage

To work with S3:

```
    import boto
    s3 = boto.connect_s3()
```

To work with EC2:

```
    import boto.ec2
    ec2 = boto.ec2.connect_to_region('us-east-1')
```

Create an S3 bucket and put an object in that bucket:

```
    import boto
    import time
    s3 = boto.connect_s3()
    
    bucket = s3.create_bucket(f'boto-demo-{int(time.time())}')
    key = bucket.new_key('mykey')
    key.set_contents_from_string("Hello world!")
    
    time.sleep(2)
    
    print(key.get_contents_as_string())
    
    key.delete()
    
    bucket.delete()
```

### S3cmd

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/s3cmd.png">
  <br/>
</p>

S3cmd is written in Python, is open-source, and is free even for commercial use.  It offers more advanced features than those found in the [AWS CLI](http://aws.amazon.com/cli/).

#### Installation

The [aws.sh script](#awssh-script) installs s3cmd.  If you prefer to install it separately, run:

    $ pip install s3cmd

Running the following command will prompt you to enter your AWS access and AWS secret keys. To follow security best practices, make sure you are using an IAM account as opposed to using the root account.

Run the following to manually configure:

    $ s3cmd --configure

Alternatively, the [aws.sh script](#awssh-script) also syncs the template ```.s3cfg``` file to your home folder.  Note running the aws.sh script will overwrite any existing ```~/.s3cfg``` file.  Update the config file with your credentials and location:

```
[Credentials]
aws_access_key_id = YOURACCESSKEY
aws_secret_access_key = YOURSECRETKEY
...
bucket_location = US
...
gpg_passphrase = YOURPASSPHRASE
```

#### Usage

The collection of [commands](http://s3tools.org/usage) is vast, but a few of the most useful are listed here.

To list all buckets:

    $ s3cmd ls

To list the contents of the bucket:

    $ s3cmd ls s3://my-bucket-name

To download a file:

    $ s3cmd get s3://my-bucket-name/myfile.txt myfile.txt

To delete a file:

    $ s3cmd del s3://my-bucket-name/myfile.txt

To delete a bucket:

    $ s3cmd del --recursive s3://my-bucket-name/

To create a bucket:

    $ s3cmd mb s3://my-bucket-name

To list bucket disk usage (human readable):

    $ s3cmd du -H s3://my-bucket-name/

To sync local (source) to s3 bucket (destination):

    $ s3cmd sync my-local-folder-path/ s3://my-bucket-name/

To sync s3 bucket (source) to local (destination):

    $ s3cmd sync s3://my-bucket-name/ my-local-folder-path/

To do a dry-run (do not perform actual sync, but get information about what would happen):

    $ s3cmd --dry-run sync s3://my-bucket-name/ my-local-folder-path/

### Redshift

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/aws_redshift.png">
  <br/>
</p>

Redshift is a fast data warehouse built on top of technology from massive parallel processing (MPP).

#### Setup

Follow these [instructions](http://docs.aws.amazon.com/redshift/latest/gsg/rs-gsg-prereq.html).

### Kinesis

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/aws_kinesis.png">
  <br/>
</p>

Kinesis streams data in real time with the ability to process thousands of data streams per second.

#### Setup

Follow these [instructions](http://docs.aws.amazon.com/kinesis/latest/dev/before-you-begin.html).

### Lambda

<p align="center">
  <img src="https://raw.githubusercontent.com/bashack/dev-setup-resources/master/res/aws_lambda.png">
  <br/>
</p>

Lambda runs code in response to events, automatically managing compute resources.

#### Setup

Follow these [instructions](http://docs.aws.amazon.com/lambda/latest/dg/setting-up.html).

### Heroku

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/heroku.jpg">
  <br/>
</p>

[Heroku](http://www.heroku.com/) is a Platform-as-a-Service (PaaS). One of the benefits of using and targeting Heroku for deployment is that it requires adherence to [12 Factor](http://www.12factor.net/). This methodology ultimately makes for scalable solutions and more loosely coupled applications/services (this is a good thing!).

#### Installation

The [aws.sh script](#awssh-script) installs the Heroku CLI.  If you prefer to install it separately, run:

    $ curl https://cli-assets.heroku.com/install-ubuntu.sh | sh

#### Usage

The [Heroku CLI Command Documentation](https://devcenter.heroku.com/articles/heroku-cli-commands) provides details on usage.

## Section 7: Data Stores

### Elasticsearch

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/elasticsearch.png">
  <br/>
</p>

Distributed, multitenant-capable full-text search engine with an HTTP web interface and schema-free JSON documents. In conjunction with the data-collection and log-parsing engine, Logstash, and the analytics platform, Kibana, it forms the Elastic Stack (or ELK stack).

#### Installation

[Elasticsearch](https://github.com/elastic/elasticsearch), [Kibana](https://github.com/elastic/kibana), and [Logstash](https://github.com/elastic/logstash) are all installed via the [datastores.sh script](#datastoressh-script).

#### Configuration

Setting up the ELK stack does require work after installation, though all dependencies required are included in the system scripts here. For specifics on edits and alterations necessary for a working configuration, see [Dots Post-Install Guide](https://raw.githubusercontent.com/bashhack/dots/master/POST_INSTALL.md).

#### Usage

To get started, refer to the [Elasticsearch Reference](https://www.elastic.co/guide/en/elasticsearch/reference/current/_basic_concepts.html).

### PostgreSQL

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/postgresql.png">
  <br/>
</p>

An ACID-compliant, transactional, object-relational database that is free and open-source.

#### Installation

[PostgreSQL](https://www.postgresql.org/docs/10/static/index.html) is installed via the [datastores.sh script](#datastoressh-script).

#### Configuration

For complete configuration, refer to the [Dots Post-Install Guide](https://raw.githubusercontent.com/bashhack/dots/master/POST_INSTALL.md).

#### Usage

Refer to the [Official PostgreSQL Tutorial](https://www.postgresql.org/docs/10/static/tutorial.html).

### Redis

<p align="center">
  <img src="https://raw.githubusercontent.com/bashhack/dev-setup-resources/master/res/redis.png">
  <br/>
</p>

Fast, in-memory data structore store, used as a database, cache, and message broker. It has built-in replication, LRU eviction, transactions, on-disk persistence, and high availability support.

#### Installation

[Redis](https://redis.io/documentation) is installed via the [datastores.sh script](#datastoressh-script).

#### Usage

For a list of available commands, see [Redis Commands](https://redis.io/commands). Additional resources for understanding the Redis store can be found in the [Redis Data Types Intro](https://redis.io/topics/data-types-intro).

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
