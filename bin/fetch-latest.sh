#!/usr/bin/env bash

#===
# fetch-latest.sh: Helper wrapper script to update all local git repositories and submodules.
# @param STRING: git_branch
#===

set -eEa -o pipefail

# To level Working directory
cd "${0%/*}";
cd ../

#===
# Variables
#===
# Check if a local envfile exists and load.
git_branch=$1

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
# run: Run our commands
##
run() {
    git pull origin ${git_branch:-main}
    git submodule foreach --recursive git pull origin ${git_branch:-main}
}

#===
# Main
#===
run

trap '' 2 3
trap traperr ERR
