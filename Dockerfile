
# syntax=docker/dockerfile:1
FROM ruby:3.0.3-buster

# Install OS dependencies needed by the gems
RUN apk add --update --no-cache \
    binutils-gold \
    build-base \
    curl \
    file \
    g++ \
    gcc \
    git \
    less \
    libstdc++ \
    libffi-dev \
    libc-dev \
    linux-headers \
    libxml2-dev \
    libxslt-dev \
    libgcrypt-dev \
    make \
    netcat-openbsd \
    nodejs \
    openssl \
    pkgconfig \
    postgresql-dev \
    python \
    tzdata \
    yarn

ARG RAILS_MASTER_KEY 
WORKDIR /app
ENV RAILS_ENV=production
ENV RAILS_MASTER_KEY=$RAILS_MASTER_KEY

# Copy package files
COPY Gemfile Gemfile.lock .

RUN yarn install
RUN bundle config set --local without 'development:test' && bundle install && bundle exec rails db:migrate

COPY . .

ENV LANG=en_US.UTF-8

# Configure the main process to run when running the image
EXPOSE 3000
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]