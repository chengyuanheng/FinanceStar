#!/bin/bash
export TERM=xterm #rvm is designed to run in a terminal where the TERM environment variable is set
export LANG=en_US.UTF-8

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

env=$1
rake db:migrate RAILS_ENV=$env VERSION=0  #or rake db:drop. Prefer downgrade to exercise migration scripts
rake db:migrate RAILS_ENV=$env
rake db:seed RAILS_ENV=$env

