
#image josechagas/rbenv-ruby-rails

FROM ubuntu
MAINTAINER José Lucas <chagasjoselucas@gmail.com>

### A build argument that is used to indicate when the user want to update this image when he is building another image using this image as base image
ONBUILD ARG NEED_UPDATE_ON_BUILD=false

########## Copying and giving the rights to execute the scripts necessary to update this image

COPY rbenv_ruby_rails /usr/local/bin/rbenv_ruby_rails
RUN chmod +x /usr/local/bin/rbenv_ruby_rails


##########

########## Search for updates for these packages when you are using it to make another docker only if build argument NEED_UPDATE_ON_BUILD value is true

ONBUILD RUN rbenv_ruby_rails --on-build -u

##########

RUN apt-get update

RUN apt-get install -y sudo

########## INSTALLING ruby-dev

RUN apt-get install -y ruby-dev

RUN ruby -v

######


##########INSTALLING another packages necessary to install some gems

RUN apt-get install -y build-essential libssl-dev zlib1g-dev libcurl4-openssl-dev

######

##########INSTALLING rbenv, a package for managing ruby versions 
#https://github.com/rbenv/rbenv

RUN apt-get install -y rbenv

######


##########INSTALLING ruby-build for installing specific versions of ruby

RUN apt-get install -y ruby-build

######

##########INSTALLING bundler

RUN gem install bundler && rbenv rehash

######

##########INSTALLING Node.js This is because Rails's asset pipeline compiler requires a Javascript runtime

RUN apt-get install -y nodejs && sudo ln -sf /usr/bin/nodejs /usr/local/bin/node

######

##########INSTALLING rails

RUN apt-get install -y rails && rbenv rehash

######


#This is the default port that rails use for communication
EXPOSE 3000