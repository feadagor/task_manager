FROM ruby:2.5

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 3

ADD . /app
COPY . /app

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN bundle install

EXPOSE 3000
CMD bundle exec rails s -b '0.0.0.0' -p 3000
