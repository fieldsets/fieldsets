#!/usr/bin/env bash

#===
# powershell.sh: Wrapper script to provide pwsh access to your container.
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
    docker exec -it "${server:-fieldsets-local}" /usr/bin/pwsh
}

#===
# Main
#===
run

trap '' 2 3
trap traperr ERR
