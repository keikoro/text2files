#!/bin/sh
#
# Create file names from lines of text
# Copyright (c) 2016 K Kollmann <code∆k.kollmann·moe>

text="You need to provide the name of a file
        whose text contents
        \nshould get
        turned into (empty) file names line by line.
        \nUsage: sh text2files.sh yourfile"
if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    echo $text
    exit
else
   fname=$1
fi

outputdir=$(dirname $fname)

echo "Reading $fname ..."
while read line || [ -n "$line" ]
do
    if [ "$line" != "" ]; then
        newfile="$outputdir/$line"
        if [ -f "$newfile" ]; then
            echo "FILE ALREADY EXISTS: $newfile – skipping"
        else
            echo "creating file $newfile"
            touch "$newfile"
        fi
    fi
done < $fname
echo "Done."