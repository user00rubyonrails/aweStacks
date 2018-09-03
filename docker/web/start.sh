#!/bin/bash
set -x

# wait for postgresql
until nc -vz $POSTGRESQL_HOST 5432; do
  echo "Postgresql is not ready, sleeping..."
  sleep 1
done
echo "Postgresql is ready, starting Rails."

# wait for elasticsearch
# until nc -vz $ELASTICSEARCH_HOST 9200; do
#   echo "Elasticsearch is not ready, sleeping..."
#   sleep 1
# done
# echo "Elasticsearch is ready, starting Rails."

# cp docker/config/database.yml config/

bundle check || bundle install
yarn install

if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

# bin/rake db:create
bin/rake db:migrate
bin/rake db:seed

#bundle exec puma -C config/puma.rb
bundle exec rails s -p 3000 -b '0.0.0.0'

