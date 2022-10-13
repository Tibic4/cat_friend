FROM ruby:3.1.2

WORKDIR /cat_friend

RUN gem install bundler

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
