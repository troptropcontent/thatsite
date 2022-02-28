
# syntax=docker/dockerfile:1
FROM ruby:3.0.3-buster

RUN apt-get install \
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
  sqlite-dev \
  libc-dev \
  linux-headers \
  readline-dev \
  file \
  imagemagick \
  git \
  curl \
  tzdata \
  && rm -rf /var/cache/apk/*

# Install nodejs
RUN curl -L https://raw.githubusercontent.com/tj/n/master/bin/n -o n && bash n 15

ARG RAILS_MASTER_KEY 
WORKDIR /app
ENV RAILS_ENV=production
ENV RAILS_MASTER_KEY=$RAILS_MASTER_KEY

COPY Gemfile Gemfile.lock .
RUN yarn install
RUN bundle config set --local without 'development:test' && bundle install && bundle exec rails db:migrate

COPY . .

ENV LANG=en_US.UTF-8

# Configure the main process to run when running the image
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]