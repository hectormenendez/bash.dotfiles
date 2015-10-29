# Get directory, where the script files resides
SELF=${BASH_SOURCE[0]}
[[ -z `readlink $SELF` ]] && SELF=`dirname $SELF` || SELF=`readlink $SELF | xargs dirname`
SELF=`realpath $SELF/..`

# Include utils!
source "$SELF/lib/utils.sh"

export HOMEBREW_GITHUB_API_TOKEN=04aea4ea0e1826957f542cfc959bd9ee12c3c545

# Environment variables
if ! $(isLinux); then
	export LC_ALL=en_US.UTF-8
	export LANG=en_US.UTF-8
fi
export DOTFILES=$SELF

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Initialise Path so it uses /usr/local/bin first.
export PATH=/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
if ! $(isLinux); then
	export PATH=$(brew --prefix coreutils)/libexec/gnubin:$HOME/.nodebrew/current/bin:$PATH
fi

# Set the creation mask, so files are created with 600 and dirs as 700
umask 077

# Shell options
shopt -s checkwinsize # check winsize after each command and adjust screen automatically,
shopt -s autocd       # Enable globs on cd
shopt -s globstar     # wildcard ** now means recursive
shopt -s nocaseglob   # case insensitive globbing
shopt -s cdspell      # Autocorrect typos in path names when using cd

# History management:
# cleanup the history file, by manually removing dups
tac $HISTFILE | awk '!x[$0]++' | tac | sponge $HISTFILE

# don't put duplicate lines in the history and erase those that already exist
# don't overwrite history on login, append to it.
HISTCONTROL=erasedups:ignorespace
shopt -s histappend
PROMPT_COMMAND="history -n; history -w; history -c; history -r; $PROMPT_COMMAND"

# Enable bash completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
	source $(brew --prefix)/etc/bash_completion
fi

# Add tab completions for SSH hostnames based on ~/.ssh/config
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set color command prompt
export PS1='\[\033[01;30m\]\h \[\033[01;34m\]\w\[\033[00m\]\n\$ '

# Prepend git branch name on command prompt.
if [ -r "$SELF/lib/git/prompt.sh" ]; then source "$SELF/lib/git/prompt.sh"; fi

# set file colors
eval `dircolors ~/.dir_colors`

# If an alias file exists, load it.
if [ -f ~/.alias ]; then source ~/.alias; fi

# Enable NVM
if [ -f $(brew --prefix nvm)/nvm.sh ]; then
	export NVM_DIR=~/.nvm
	source $(brew --prefix nvm)/nvm.sh
fi