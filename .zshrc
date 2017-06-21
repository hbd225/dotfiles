eval "$(rbenv init -)"

bindkey -v

export ZSH=$HOME/.oh-my-zsh
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
export GOPATH=$HOME/.go
export GOROOT=/usr/local/opt/go/libexec
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export BUNDLER_EDITOR=vim
export RBENV_ROOT=/usr/local/var/rbenv
export PATH=/usr/local/var/rbenv/bin:/usr/local/var/rbenv/shims:/usr/local/Cellar/httpd/2.2.26/sbin:/usr/local/Cellar/postgresql/9.2.4/bin:/usr/local/git/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/local/sbin:/usr/X11/bin:/usr/bin:/usr/sbin:/bin:/sbin:/Applications/android-sdk-macosx/platform-tools:$HOME/.nodenv/shims:$GOPATH/bin:$GOROOT/bin:$PATH

# tmp
export PATH=/usr/local/opt/mysql@5.5/bin:$PATH
export PBCD_EDITOR_INNER=//planbcd.dev:5254/javascripts/editor-inner.js

alias tmux="TERM=screen-256color-bce tmux"
if [ -n "$TMUX" ]; then
  alias pbcopy="reattach-to-user-namespace pbcopy"
fi

[[ -z "$TMUX" && ! -z "$PS1" ]] && tmux

ZSH_THEME="robbyrussell"

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
alias tf='tail -f'
alias lh='ls -lh'
alias sr='spring rspec'
alias dk='docker'
alias dc='docker-compose'
alias va='vagrant'
alias p='peco'
alias ps='ps aux'
alias pspeco='ps | peco'

autoload bashcompinit
bashcompinit

### peco
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi

    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

function agvim () {
    vim $(ag $@ | peco --query "$LBUFFER" | awk -F : '{print "-c " $2 " " $1}')
}

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
