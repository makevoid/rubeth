# basic for rubeth coffeescript port
#
#
# FROM node:6.2
#
# RUN npm i -g coffee-script iced-coffee-script
#
# RUN ls
#
# CMD ./run_app.sh


# FROM ruby:2.1
FROM makevoid/ruby-ubuntu

# Install SolC
# ----
#

ENV DEBIAN_FRONTEND noninteractive

USER root

RUN apt-get update && \
    apt-get upgrade -q -y && \
    apt-get dist-upgrade -q -y && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 923F6CA9 && \
    echo "deb http://ppa.launchpad.net/ethereum/ethereum/ubuntu xenial main" | tee -a /etc/apt/sources.list.d/ethereum.list && \
    apt-get update && \
    apt-get install -q -y solc && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get update
#
# -----

RUN apt-get install -y git
RUN apt-get install -y git

RUN mkdir /app
WORKDIR /app

ENV BUNDLE_PATH /tmp/bundle
ADD Gemfile /app
ADD Gemfile.lock /app

ENV DOCKER 1

RUN chown www:www -R /usr/local/bundle
RUN gem install bundler

USER www
RUN bundle install

# global add
ADD . /app
# RUN bundle install



CMD ./run_app.sh
