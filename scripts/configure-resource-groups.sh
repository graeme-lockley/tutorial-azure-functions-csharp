#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# shellcheck source=scripts/_env.sh
. "$SCRIPT_DIR"/_env.sh

az deployment sub create \
    --name "configure-resource-groups" \
    --location centralus \
    --template-file "${SCRIPT_DIR}/../infra/resource-groups.bicep" \
    --parameters "resourceGroupName=${RESOURCE_GROUP_NAME}" \
    --parameters "resourceGroupLocation=${RESOURCE_GROUP_LOCATION}"
