# ~/.profile: executed by the command interpreter for login shells.

# This file is not read by bash(1) if ~/.bash_profile or ~/.bash_login
# exists.
#
# if running bash
if [ -n "${BASH_VERSION}" ]; then
  if [ -f "${HOME}/.bashrc" ]; then
    source "${HOME}/.bashrc"
  fi
fi

# Initialise ssh-agent
source ${HOME}/.ssh-agent-setup.sh

[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

# Just say no
export VAGRANT_GOVUK_NFS=no

# Set paths
export GOROOT=`go env GOROOT`
export GOPATH=$HOME/go

export PATH=$HOME/bin:/usr/local/bin:$GOPATH/bin:$PATH

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# Preferred editor
export EDITOR='vim'
