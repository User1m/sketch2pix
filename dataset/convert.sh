#!/bin/bash

if [ "$1" != "--path" ]; then
    echo "error: --path missing" >&2;
    echo "usage: ./convert.sh --path celebfaces --edge 2" >&2;
    exit 1;
elif [ "$3" != "--edge" ]; then
    echo "error: --edge missing" >&2;
    echo "usage: ./convert.sh --edge 2" >&2;
    exit 1;
fi

re='^[0-9]+$'
if ! [[ $4 =~ $re ]] ; then
    echo "error: --edge value is Not a number" >&2;
    exit 1;
fi

parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )
cd $parent_path/$2/face
##cd $2
#echo $(pwd -P)

#for dir in *
#do
#    if [ -d $dir ] && [ $dir != "CUHKfaces" ]; then
#        cd $dir/face
#
        for dir in *
        do
            if [ -d $dir ]; then
                cd $dir
                for image_file in *.jpg
                do
                    convert $image_file  -colorspace Gray  -edge $4 -negate ../../edge/$dir/$image_file
                done
                cd ../
            fi
        done
#        cd ../../
#    fi
#done

