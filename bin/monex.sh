#!/bin/bash

function doHelp {
    echo "Usage: monex.sh <file> <command>"
    echo "Example: monex.sh README.rst \"make rtfm\""
    exit 1
}

FILE=$1
CMD=$2

if [ -z $FILE ] || [ ! -f $FILE ]; then
    echo "Please specify a file to watch."
    doHelp
fi

if [ -z "$CMD" ]; then
    echo "Please specify a command to execute"
    doHelp
fi

echo "Monitoring $1 for changes."

while [ 1 ]; do
    eval $(stat -s $1)

    if [ $last_mtime ] && [ $st_mtime -ne $last_mtime ]; then
        eval $CMD
    fi
    last_mtime=$st_mtime
done
