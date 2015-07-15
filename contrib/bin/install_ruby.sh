#!/bin/bash -l

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable

source /etc/profile.d/rvm.sh

usermod -G 1002 default

rvm install 2.2.2
rvm use 2.2.2 --default
gem install bundler

rvm install 2.1.5
rvm use 2.1.5 
gem install bundler

rvm install 2.0.0
rvm use 2.0.0 
gem install bundler


rvm use default
ruby -v

