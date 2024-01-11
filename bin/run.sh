#!/bin/bash
set -e

###
# Run a command on the docker container using a local path.
# This script assumes your script is in the top level directory of any necessary files needs and copies the entire directory into the fieldsets local container.
###
SCRIPT_NAME=$1
FULL_PATH=$(readlink -f "${SCRIPT_NAME}");
DIR=$(dirname "${FULL_PATH}");
FILE=$(basename "${SCRIPT_NAME}");

echo "Source dir: ${DIR}"
echo "Executing script: ${FILE}"
docker cp ${DIR} fieldsets-local:/script/
docker exec -it fieldsets-local /bin/bash -c "/script/${FILE};rm -rf /script;"
