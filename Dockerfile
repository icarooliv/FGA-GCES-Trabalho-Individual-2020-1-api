FROM ruby:2.7.2
RUN apt-get update -qq && apt-get install -y postgresql-client
WORKDIR /api

COPY Gemfile /api/Gemfile
COPY Gemfile.lock /api/Gemfile.lock
RUN bundle install

COPY . /api

ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.7.3/wait /wait
RUN chmod +x /wait
RUN chmod +x entrypoint.sh

EXPOSE 3000
CMD /wait && ./entrypoint.sh