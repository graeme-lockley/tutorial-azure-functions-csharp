#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

. "${SCRIPT_DIR}/_env.sh"

for FILE in $( ls -1 $SCRIPT_DIR/../infra/*.bicep )
do
    OUTPUT=$( az bicep build --file $FILE 2>&1 )
    if [[ "$?" -ne "0" ]]
    then
        echo Lint Failed: $FILE
        echo $OUTPUT
        exit 1
    elif [[ "$OUTPUT" -ne "" ]]
    then
        echo Lint Failed: $FILE
        echo $OUTPUT
        exit 1
    fi
done

exit 0