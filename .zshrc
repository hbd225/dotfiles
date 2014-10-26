eval "$(rbenv init -)"

bindkey -v

export ZSH=$HOME/.oh-my-zsh
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad

export COCOS_CONSOLE_ROOT=/Users/Apple/dev/ios/cocos2d-x-3.1.1/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$HOME/.rbenv/bin:$HOME/.rbenv/shims:/usr/local/Cellar/httpd/2.2.26/sbin:/usr/local/Cellar/postgresql/9.2.4/bin:/usr/local/git/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/local/sbin:/usr/X11/bin:/usr/bin:/usr/sbin:/bin:/sbin:$PATH

alias tmux="TERM=screen-256color-bce tmux"
if [ -n "$TMUX" ]; then
  alias pbcopy="reattach-to-user-namespace pbcopy"
fi

alias ll='ls -l'
alias la='ls -a'
alias g='git'
alias t="TERM=screen-256color-bce tmux"
alias mongod_start="mongod --config /etc/mongod.conf"
alias gl="git log"
alias ts="tmux switch -t "
alias gr="grep -R "
alias be="bundle exec "
alias tc="tmux save-buffer - | reattach-to-user-namespace pbcopy"

[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="simple"

plugins=(git ruby osx bundler brew rails)

source $ZSH/oh-my-zsh.sh

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13
