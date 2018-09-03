# Assumes the database container is named 'db'

DOCKER_DB_NAME="$(docker-compose ps -q db)"
DATABASENAME=nykgear-development-3
DB_USER=postgres
LOCAL_DUMP_PATH="latest.dump"

docker-compose up -d db
docker exec -i "${DOCKER_DB_NAME}" pg_restore --verbose --clean --no-acl --no-owner -U "${DB_USER}" -d "${DATABASENAME}" < "${LOCAL_DUMP_PATH}"
docker-compose stop db


#docker exec -i docker_nykgear_db_1 pg_restore --verbose --clean --no-acl --no-owner -U postgres -d nykgear-development-3 < latest.dump
