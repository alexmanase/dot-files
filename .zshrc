export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="sammy"

plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

function mkd() {
   mkdir -p "$@" && cd "$@"
}

function tinker()
{
  if [ -z "$1" ]
    then
      php artisan tinker
    else
      php artisan tinker --execute="dd($1);"
  fi
}

function commit() {
  commitMessage="$*"

  if [ "$commitMessage" = "" ]; then
     commitMessage="wip"
  fi

  git add .
  eval "git commit -a -m '${commitMessage}'"
}

function db {
    if [ "$1" = "refresh" ]; then
        mysql -uroot -e "drop database $2; create database $2"
    elif [ "$1" = "create" ]; then
        mysql -uroot -e "create database $2"
    elif [ "$1" = "drop" ]; then
        mysql -uroot -e "drop database $2"
    elif [ "$1" = "list" ]; then
        mysql -uroot -e "show databases" | perl -p -e's/\|| *//g'
    fi
}

alias ..="cd .."
alias cd..="cd .."

alias chmox='chmod +x'

alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"

# Shortcuts
alias reloadshell="source ~/.zshrc"
alias ll="ls -laF"
alias c="clear"
alias o="open ."
alias wifipass="security find-generic-password -wa"

alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

# Directories
alias dotfiles="subl ~/.zshrc"
alias repos="cd ~/Documents/repos"

# Git
alias g="git"
alias push="git push"
alias clone="git clone"
alias nah='git reset --hard;git clean -df'
alias log='git log --oneline --decorate --color'
alias amend="git add . && git commit --amend --no-edit"
alias diff="git diff"
alias force="git push --force"
alias resolve="git add . && git commit --no-edit"
alias deploy_commit="git commit --allow-empty -m 'deploy'"
alias status="git status"
alias cleanup="commit 'chore: cleanup'"

# PHP
# alias php="php82"
alias pestfresh="composer require pestphp/pest --dev --with-all-dependencies && p --init && rm -rf tests/ExampleTest.php && commit 'feat: install Pest'"
alias cfresh="rm -rf vendor/ composer.lock && composer install"
alias artisan="php artisan"
alias a="php artisan"
alias t="php artisan test"
alias mfs="artisan migrate:fresh --seed"
alias pest="./vendor/bin/pest"
alias p="pest"
alias pf="pest --filter"
alias pp="pest --parallel"
alias pc="pest --coverage"
alias ppc="pest --parallel --coverage"
alias pdf="php artisan pest:dusk --filter"
alias pd="php artisan pest:dusk"
alias pa="./vendor/bin/phpstan analyse"
alias bf="echo 'blade-format --write \"./resources/**/*.blade.php\"' && blade-formatter --write './resources/**/*.blade.php'"
alias pint="./vendor/bin/pint"

# JS
alias yfresh="rm -rf node_modules/ package-lock.json yarn.lock pnpm-lock.yaml && yarn install"
alias npmfresh="rm -rf node_modules/ package-lock.json yarn.lock pnpm-lock.yaml && npm install"
alias y="yarn"
alias yd="yarn install && yarn dev"
alias d="yarn dev"

export PATH="$HOME/.composer/vendor/bin:$PATH"
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:$HOME/bin
export NPM_CONFIG_PREFIX=~/.npm-global
export PATH=$PATH:~/.npm-global/bin
export EDITOR="/usr/bin/nano"
