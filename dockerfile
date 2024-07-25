FROM ruby:3.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /myapp
WORKDIR /myapp
ENV RAILS_ENV="production"
ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock
RUN bundle install
ADD . /myapp
EXPOSE 3000

CMD [ "rails","server","-b","0.0.0.0" ]