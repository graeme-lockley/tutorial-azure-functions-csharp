#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

. "${SCRIPT_DIR}/_env.sh"

for FILE in "$SCRIPT_DIR"/../infra/*.bicep
do
    echo "$FILE"
    
    if ! az bicep build --file "$FILE" > output.log 2>&1
    then
        echo Error: Lint Failed
        cat output.log
        exit 1
    elif [ "$( cat output.log | wc -l )" -ne "0" ]
    then
        echo Warnings: Lint Failed
        cat output.log
        exit 1
    fi
done

exit 0