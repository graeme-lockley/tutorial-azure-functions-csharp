#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

. "${SCRIPT_DIR}/_env.sh"

az deployment group create \
    --name "configure-functions" \
    --resource-group ${RESOURCE_GROUP_NAME} \
    --template-file "${SCRIPT_DIR}/../infra/functions.bicep" \
    --parameters appName=ffunc
