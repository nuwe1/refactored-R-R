FROM ruby:3.0.0-alpine3.12

RUN apk --update add nodejs yarn build-base ruby-dev git sqlite-dev tzdata

RUN mkdir /app
WORKDIR /app

ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock

RUN bundle install

ADD package.json /app/package.json
ADD yarn.lock /app/yarn.lock

RUN yarn install

ADD . /app
