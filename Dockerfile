FROM ruby:2.7.1
RUN apt-get update -qq \
&& apt-get install -y nodejs postgresql-client

ADD . /allygator-shuttle
WORKDIR /allygator-shuttle

RUN bundle install

EXPOSE 3000

CMD ["bash"]