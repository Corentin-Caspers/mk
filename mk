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
    echo "##\n## EPITECH PROJECT, 2018\n## ${USERNAME}\n## file description:\n## $1\n##\n\n"
}
create_makefile_variables()
{
    echo "NAME\t=\tcbinary\n\nSRC\t=\tmain.c \ \n\nOBJ\t=\t\$(SRC:.c=.o)\n\n"
}
create_makefile_rules()
{
    echo "all:\t\t\$(NAME)\n\n\$(NAME):\t\$(OBJ)\n\t\tcc \$(OBJ) -o \$(NAME) -I./include\n\nclean:\n\t\trm -rf \$(OBJ)\n\nfclean:\t\tclean\n\t\trm -rf$(NAME)\n\nre:\t\tfclean all\n\n.PHONY:\t\tall clean fclean re"
}
create_makefile()
{
    local header=$(create_makefile_header $1)
    local variables=$(create_makefile_variables)
    local rules=$(create_makefile_rules)

    echo -e $header$variables$rules > Makefile
}
create_header()
{
    echo "/*\n** EPITECH PROJECT, 2018\n** ${USERNAME}\n** file description:\n** $1\n*/\n\n"
}
create_include()
{
    echo "#include \"$1.h\""
}
create_main()
{
    echo "int main(int ac, char **av, char **env)\n{\n\treturn (0);\n}\n"
}
create_src()
{
    local header=$(create_header main.c)
    local include=$(create_include main)
    local main=$(create_main)
    mkdir src
    echo -e "$header$include\n\n$main" > src/main.c
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
        create_src
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
