FROM ruby:2.5.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev netcat \
  xvfb \
  graphviz \
  ttf-freefont \
  qt5-default \
  libqt5webkit5-dev \
  gstreamer1.0-plugins-base \
  gstreamer1.0-tools \
  gstreamer1.0-x
RUN curl -sL https://deb.nodesource.com/setup_9.x | bash
RUN apt-get install -y nodejs
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq && apt-get install yarn
RUN mkdir /awe_stacks
WORKDIR /awe_stacks
ADD Gemfile /awe_stacks/Gemfile
ADD Gemfile.lock /awe_stacks/Gemfile.lock
RUN bundle install
ADD . /awe_stacks
