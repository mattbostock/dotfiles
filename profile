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
