Matt's dotfiles
========

Matt's personal configuration files for POSIX-compliant shell environments. Currently used on Mac OS X and Cygwin.

Install
-------

Clone this repository:

    git clone https://github.com/mattbostock/dotfiles.git
  
Install [rcm](https://github.com/thoughtbot/rcm), which helps manage dotfiles.

Install:

    rcup -d dotfiles -x README.md -x LICENSE

This will create symlinks for config files in your home directory.

You can safely run `rcup` multiple times to update:

    rcup
