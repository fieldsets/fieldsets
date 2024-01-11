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
    # This script provides you with the the cli terminal client
    docker exec -it "${server}" /bin/sh -c 'if [ -f /bin/bash ];then /bin/bash;else /bin/sh;fi'
}

#===
# Main
#===
run

trap '' 2 3
trap traperr ERR
