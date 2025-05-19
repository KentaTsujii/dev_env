eval "$(starship init zsh)"
eval "$(sheldon source)"

export NVM_LAZY_LOAD_EXTRA_COMMANDS=('vim' 'nvim')

export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=10000

setopt hist_ignore_all_dups
setopt auto_cd
setopt auto_pushd
setopt correct
setopt share_history

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

alias ls='ls --color'


# added by Snowflake SnowSQL installer
export PATH=/home/kentatsujii/bin:$PATH

. "$HOME/.local/bin/env"

export EDITOR=nvim
eval "$(direnv hook zsh)"

# for pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export AWS_PROFILE=plus_dev
