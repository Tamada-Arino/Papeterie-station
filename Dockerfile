FROM ruby:2.7.8
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y sqlite3 libsqlite3-dev
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs

WORKDIR /papeterie_station

ADD Gemfile /papeterie_station/Gemfile
ADD Gemfile.lock /papeterie_station/Gemfile.lock

RUN gem install bundler -v 2.4.22
RUN bundle install

ADD . /papeterie_station
