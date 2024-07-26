#!/usr/bin/env bash

#===
# emit-event.sh: Wrapper script to provide send an event to the event logger db from your local environment.
# @param STRING: event_name
# @param STRING: pipeline_name
# @param STRING: status
# @param FILEPATH || JSON: metadata
#===

set -eEa -o pipefail
cd "${0%/*}";
cd ../

#===
# Variables
#===
# Check if a local envfile exists and load.
event_name=$1
pipeline_name=$2
status=${3:-pending}
metadata=${4:-/dev/stdin}

source "./lib/shell/utils.sh"

#===
# Functions
#===

##
# run: Run our command
##
run() {
    local metadata_json

    if [[ -e "$metadata" ]]; then
        metadata_json=$(cat "${metadata}")
    else
        metadata_json="${metadata}"
    fi

    docker exec fieldsets-local /usr/local/fieldsets/bin/emit-event.sh "${event_name}" "${pipeline_name}" "${status}" "${metadata_json}"
}

#===
# Main
#===
run

trap traperr ERR
