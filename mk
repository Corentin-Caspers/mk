#!/bin/bash

check_makefile()
{
    local fileList=$(ls)
    local exist=0
    for file in $fileList
    do
        if [ "$file" = "Makefile" ] && [ -e $file ]
        then
            exist=1
        fi
    done
    echo $exist;
}
check_include()
{
    local fileList=$(ls)
    local exist=0

    for file in $fileList
    do
        if [ "$file" = "include" ] && [ -d $file ]
        then
            exist=1
        fi
    done
    echo $exist;
}
check_src()
{
    local fileList=$(ls)
    local exist=0

    for file in $fileList
    do
        if [ "$file" = "src" ] && [ -d $file ]
        then
            exist=1
        fi
    done
    echo $exist;
}
create_makefile_header()
{
    echo "#\n# EPITECH PROJECT, 2018\n# ${USERNAME}\n# file description:\n# $1\n#"
}
create_makefile()
{
    local header=$(create_makefile_header $1)

    echo -e $header
}
create_root() 
{
    local makefileExist=$(check_makefile)
    local includeExist=$(check_include)
    local srcExist=$(check_src)

    if [ $makefileExist == 0 ]
    then
        create_makefile Makefile
    fi
    if [ $includeExist == 0 ]
    then
        echo "I am going to create a include"
    fi
    if [ $srcExist == 0 ]
    then
        echo "I am going to create a src"
    fi
}

if [ $# = 0 ]
then
    create_root
fi
if [ $# = 1 ]
then
    echo "We have not yet implemented the one argument version"
fi
