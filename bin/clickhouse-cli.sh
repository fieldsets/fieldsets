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
        CH User: $CLICKHOUSE_USER
        CH Host: $CLICKHOUSE_HOST
        CH Port: $CLICKHOUSE_PORT
        CH DB: $CLICKHOUSE_DB";
fi

# This script provides you with the clickhouse terminal client with some timeout settings set so that calls to any external dbs using clickhouse's `remote()` function do not time out. 
docker exec -it fieldsets-clickhouse clickhouse-client --host $CLICKHOUSE_HOST --port $CLICKHOUSE_PORT --user $CLICKHOUSE_USER --password $CLICKHOUSE_PASSWORD --http_connection_timeout 0 --http_receive_timeout 0 --http_send_timeout 0 --connect_timeout 600 --receive_timeout 600 --send_timeout 600 --connections_with_failover_max_tries 5 --connect_timeout_with_failover_ms 6000 --multiquery
