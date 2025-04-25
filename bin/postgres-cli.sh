#!/bin/bash
set -e

# Check if a local envfile exists and load.
cd "${0%/*}";
cd ../
if [ -f .env ]; then
    set -o allexport
    source .env
    set +o allexport

    echo "Usig local dotenv file variables: 
        PG User: $POSTGRES_USER
        PG Host: $POSTGRES_HOST
        PG Port: $POSTGRES_PORT
        PG DB: $POSTGRES_DB";
fi
PGPASSWORD=${POSTGRES_PASSWORD}

# This script provides you with the postgresql terminal client.
docker exec -it fieldsets-db /bin/bash -c "export PGPASSWORD=${POSTGRES_PASSWORD}; psql --host ${POSTGRES_HOST} --username ${POSTGRES_USER} --port ${POSTGRES_PORT} --dbname ${POSTGRES_DB}"
