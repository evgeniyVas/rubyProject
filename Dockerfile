FROM ruby:3.0.2-alpine

ENV BUNDLER_VERSION 2.2.27
ENV RAILS_PORT 3000
ENV APP_PATH '/app'

RUN apk add --update --no-cache \
      build-base \
      git \
      less \
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
      tzdata \
      yarn \
      && rm -rf /cache/apk/*

RUN gem install bundler --version "$BUNDLER_VERSION"

WORKDIR $APP_PATH

COPY Gemfile Gemfile.lock ./

RUN bundle check || bundle install

COPY package.json yarn.lock ./

RUN yarn install --check-files

COPY . ./

EXPOSE $RAILS_PORT

ENTRYPOINT ["./entrypoints/docker-entrypoint.sh"]