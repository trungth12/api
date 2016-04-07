FROM ruby:2.3
MAINTAINER checkraiser11@gmail.com

# Default settings
ENV RAILS_ENV development
ENV APP_HOME /usr/src/hpu

# Set up working dirs
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# Set up gems
COPY Gemfile* $APP_HOME/
ENV BUNDLE_PATH /gems
RUN bundle check || bundle install

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]

