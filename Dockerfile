FROM ruby:3.2.6-alpine3.21

RUN apk update
RUN apk add git
RUN apk add make
RUN apk add gcc
RUN apk add g++
RUN apk add ruby-dev
RUN apk add libressl-dev
RUN apk add libc-dev

RUN bundle install

# hack solution for google-protobuf issues:
RUN apk add gcompat 
RUN gem uninstall google-protobuf -a --force
RUN gem install --platform ruby google-protobuf -v 3.25.5
RUN sed -i 's/google-protobuf (3.25.5-aarch64-linux)/google-protobuf (3.25.5)/g' Gemfile.lock