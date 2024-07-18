#!/bin/bash
TIMES=10
INTERVAL=1

workdir="./tmp/output"
pid=$1
if [ -z "${pid}" ]; then
    echo ERROR
    exit 1
fi

rm -fr tmp
mkdir -p ${workdir}

for n in $(seq ${TIMES})
do
    output=${workdir}/$(printf "%03d" $n)
    echo "jstack ${pid} > ${output}"
    jstack ${pid} > ${output}
    sleep ${INTERVAL}
done
