eval "$(rbenv init -)"

bindkey -v

export ZSH=$HOME/.oh-my-zsh
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PGDATA=/usr/local/var/postgres
export PATH=$HOME/.rbenv/bin:$HOME/.rbenv/shims:/usr/local/Cellar/httpd/2.2.26/sbin:/usr/local/Cellar/postgresql/9.2.4/bin:/usr/local/git/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/local/sbin:/usr/X11/bin:/usr/bin:/usr/sbin:/bin:/sbin:$PATH
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BUNDLER_EDITOR=vim

alias tmux="TERM=screen-256color-bce tmux"
if [ -n "$TMUX" ]; then
  alias pbcopy="reattach-to-user-namespace pbcopy"
fi

[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux

ZSH_THEME="simple"

plugins=(git ruby osx bundler brew rails)

source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

alias v='vim'
alias ll='ls -l'
alias la='ls -a'
alias g='git'
alias gs='git status'
alias t="TERM=screen-256color-bce tmux"
alias ts="tmux switch -t "
alias mongod_start="mongod --config /etc/mongod.conf"
alias gr="grep -R "
alias be="bundle exec"
alias s="bundle exec rails s"
alias c="bundle exec rails c"
alias rbconfigure="../configure --prefix=$HOME/.rbenv/versions/trunk --with-readline-dir=$(brew --prefix readline) --with-openssl-dir=$(brew --prefix openssl)"
alias re="rbenv"
alias rbsh="rbenv shell"
alias l='less'
alias devrails='/Users/dev/github/rails-dev-box/rails/railties/exe/rails'
alias dbundle='ruby -I ~/github/bundler/lib ~/github/bundler/exe/bundle'
alias p='ps aux | grep'
alias tf='tail -f'
alias lh='ls -lh'
alias sr='spring rspec'
alias d='docker'

autoload bashcompinit
bashcompinit
source ~/.git-completion.sh

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# set docker configuration
eval "$(docker-machine env default)"
