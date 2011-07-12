#!/bin/bash

if [ "`echo $0 | cut -c1`" = "/" ]; then
    SCRIPTS_PATH=`dirname $0`
else
    SCRIPTS_PATH=$(dirname `pwd`/`echo $0 | cut -c3-`)
fi

DEST="$HOME/bin"


if [ ! -d $DEST ]; then
    mkdir $DEST
fi

for i in $SCRIPTS_PATH/bin/*; do
    ln -s $i $DEST/
done
