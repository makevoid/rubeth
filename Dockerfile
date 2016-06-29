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


FROM ruby:2.1

RUN apt-get install -y git

RUN mkdir /app
WORKDIR /app

ENV BUNDLE_PATH /tmp/bundle
ADD Gemfile /app
ADD Gemfile.lock /app
RUN bundle install

# global add
ADD . /app
# RUN bundle install


CMD ./run_app.sh
