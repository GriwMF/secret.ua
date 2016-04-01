FROM ruby:2.3.0
RUN apt-get update -qq \
  && apt-get install -y build-essential libpq-dev libxml2-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
RUN bundle config build.nokogiri --use-system-libraries
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
ENV SECRET_KEY_BASE $(openssl rand -base64 32)