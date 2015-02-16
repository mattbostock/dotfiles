Matt's dotfiles
===============

Matt's personal configuration files for POSIX-compliant shell environments. Currently used on Mac OS X only.

Prerequisites
-------------

The dotfiles presented here rely on by [Boxen configuration][boxen-config].
When Boxen is run, it [clones this repository][boxen-clone] then runs `rcup` (see below).

[boxen-config]: https://github.com/alphagov/gds-boxen/blob/master/modules/people/manifests/mattbostock.pp
[boxen-clone]: https://github.com/alphagov/gds-boxen/blob/2b692c6ceb7a6924e60910047368576b4d6c1979/modules/people/manifests/mattbostock.pp#L53-L60

Install
-------

Clone this repository:

    git clone https://github.com/mattbostock/dotfiles.git

I use [rcm](https://github.com/thoughtbot/rcm) to manage symlinks to the files in this repository
and run some [hooks][], for example installing the Vim plugins I use.

[hooks]: https://github.com/mattbostock/dotfiles/blob/aa310e110deb45917c5bdddf808f7ecbe4bf50b0/hooks/post-up

Manual install:

    rcup -x README.md -x LICENSE

This will create symlinks for config files in your home directory.

You can safely run `rcup` multiple times to update:

    rcup
