#!/bin/bash
input_dir="./tmp/output"
includes="./tmp/includes"

cp includes ${includes}
echo "^#" >> ${includes}

for input in $(find ${input_dir} -type f)
do
    awk -f conv1.awk ${input} \
        | grep -v -f excludes \
        | grep -f ${includes} \
        | awk -f conv2.awk
done | sort \
    | uniq -c \
    | awk '{ print $1"\t"$2 }' \
    | sort -nr
