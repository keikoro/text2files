#!/bin/sh
#
# Create file names from lines of text
# Copyright (c) 2016 K Kollmann <code∆k.kollmann·moe>

helptext="You need to provide the name of a file
        whose text contents
        \nshould be turned into (empty) file names line by line.
        \nUsage: sh text2files.sh FILE [OUTPUTDIR]"

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    echo $helptext
    exit
else
   fname=$1
fi

outputdir=$(dirname $fname)

if [ $2 ]; then
    usedir=$2
    # replace . with the cwd
    # replace ~ with home dir
    usedir="${usedir/#\./$(pwd)}"
    usedir="${usedir/#\~/$HOME}"
    if [ -d "$usedir" ]; then
        outputdir=$usedir
    else
        echo "The specified output directory $usedir does not exist!"
        exit
    fi
fi

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