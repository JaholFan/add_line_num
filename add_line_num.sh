#!/bin/bash
usage()
{
    echo "error! please run the script like this:"
    echo "    $1 source_file_name target_file_name"
}

if [ $# -ne 2 ]; then
    usage $0
    exit 0
fi

src_file=$1
target_file=$2
if [ ! -f ${src_file} ]; then
    echo "no file ${src_file} exist"
    exit 0
fi
if [ -f ${target_file} ]; then
    rm ${target_file}
fi
touch ${target_file}

cat -b ${src_file} | while read line
do
    echo "${line}" >> ${target_file}
done

