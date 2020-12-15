#! /bin/bash
rm ./tmp/pids/server.pid

bundle exec rake db:create
bundle exec rake db:migrate

bin/rails server --port 3000 --binding 0.0.0.0