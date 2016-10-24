#!/bin/sh

# script to install config files
# usage: install.sh file [file2]...

for file in $*
do
    dst_file=$HOME/.$file
    if (test -f $dst_file) then
        if (test -h $dst_file) then
            echo "$dst_file already exists and it's a link"
        else
            echo "$dst_file already exists"
        fi
    else
        if (ln -s $(pwd)/$file $dst_file) then
            echo "$dst_file successfully installed"
        fi
    fi
done
echo
exit 0
