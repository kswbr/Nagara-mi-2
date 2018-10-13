FROM ruby:2.5.1-alpine

RUN apk update && apk upgrade && apk add --update --no-cache alpine-sdk tzdata postgresql-dev nodejs sqlite sqlite-dev
RUN apk add --update --no-cache \
      bash \
      git \
      openssh \
      postgresql \
      ruby-json \
      tzdata \
      yaml
RUN gem install rails

RUN mkdir /app
WORKDIR /app

