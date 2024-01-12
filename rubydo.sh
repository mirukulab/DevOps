#!/bin/bash

# Update system packages
sudo apt-get update

# Install dependencies for Ruby
sudo apt-get install -y git curl libssl-dev libreadline-dev zlib1g-dev autoconf bison build-essential libyaml-dev libreadline-dev libncurses5-dev libffi-dev libgdbm-dev

# Clone rbenv and ruby-build
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

# Add rbenv to bash so that it loads every time you open a Terminal
echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bashrc
source ~/.bashrc

# Install Ruby
rbenv install 2.7.2
rbenv global 2.7.2

# Install bundler, rake, chef, knife and Capistrano
gem install bundler
gem install rake
gem install chef
gem install knife
gem install capistrano

# Rehash rbenv shims (to keep everything up-to-date)
rbenv rehash

# Display installed Ruby version and list of installed gems
echo "Installed Ruby version:"
ruby -v
echo "List of installed gems:"
gem list