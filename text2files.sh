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

echo "Reading $1..."
while read line || [ -n "$line" ]
do
    if [ "$line" != "" ]; then
        if [ -f "$line" ]; then
            echo "FILE ALREADY EXISTS: $line – skipping"
        else
            echo "creating file $line"
           touch "$line"
        fi
    fi
done < $fname
echo "Done."