
# syntax=docker/dockerfile:1
FROM ruby:3.0.3-buster

# Install Ruby packages
RUN apt-get install curl

RUN apk add --update --virtual \
  runtime-deps \
  postgresql-client \
  build-base \
  libxml2-dev \
  libxslt-dev \
  nodejs \
  yarn \
  libffi-dev \
  readline \
  build-base \
  postgresql-dev \
  libc-dev \
  linux-headers \
  readline-dev \
  file \
  imagemagick \
  git \
  tzdata \
  && rm -rf /var/cache/apk/*

ARG APP_ROOT=/app
ARG RAILS_MASTER_KEY 
WORKDIR $APP_ROOT
ENV RAILS_ENV=production
ENV RAILS_MASTER_KEY=$RAILS_MASTER_KEY

COPY Gemfile Gemfile.lock $APP_ROOT/
RUN yarn install
RUN bundle config set --local without 'development:test' && bundle install && bundle exec rails db:migrate

COPY . $APP_ROOT

ENV LANG=en_US.UTF-8

# Configure the main process to run when running the image
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]