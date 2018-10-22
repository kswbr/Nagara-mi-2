FROM ruby:2.5.1-alpine

RUN apk update && apk upgrade && apk add --update --no-cache alpine-sdk tzdata postgresql-dev nodejs bash

RUN mkdir /app
WORKDIR /app

RUN gem install rails
RUN rails new . -d postgresql --skip-bundle

ADD app/Gemfile /app/Gemfile
ADD app/Gemfile.lock /app/Gemfile.lock

RUN bundle install --path vendor/bundle -j4  --without test development
ADD app/. /app

EXPOSE  3000
