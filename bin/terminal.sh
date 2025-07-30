#!/usr/bin/env bash

#===
# terminal.sh: Wrapper script to provide shell-like access to your container.
#
# @param server | String 
#
#===

set -eEa -o pipefail

#===
# Variables
#===
server=$1

#===
# Functions
#===

##
# traperr: Better error handling
##
traperr() {
  echo "ERROR: ${BASH_SOURCE[1]} at about ${BASH_LINENO[0]}"
}

##
# run: Run our docker command
##
run() {
    local prefix="fieldsets-"
    local docker_container_name
    # Allow short names and add on prefix
    if [[ "${server:-fieldsets-local}" == "$prefix"* ]]; then
        docker_container_name="${server:-fieldsets-local}"
    else
        docker_container_name="${prefix}${server}"
    fi
    # This script provides you with the the cli terminal client
    docker exec -it "${docker_container_name}" /bin/sh -c 'if [ -f /bin/bash ];then /bin/bash;else /bin/sh;fi'
}

#===
# Main
#===
run

trap '' 2 3
trap traperr ERR
