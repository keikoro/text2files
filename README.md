# Text 2 Files

Use the text content of a file to create (empty) files.  
Each line of text in the source file is used as a file name.

Usage:
```
$ ./text2files.sh INPUTFILE [OUTPUTDIR]
```

`INPUTFILE` is the file based on which files are created.  
Lines starting with `#` or `-` will be ignored.

Specify the optional parameter `OUTPUTDIR` if you want to output the files to another directory than the one containing `INPUTFILE` (which is the default). Tilde expansion (`~` as shortcut for the home directory) and `.` for the current working directory will work when specifying the output directory.

Note:  
The script checks for matching files names/paths and only attempts to create new files if they don't exist yet.