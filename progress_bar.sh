#!/bin/bash

RUN_TIMES=$1
FAIL_COUNT=0
DISPLAY_COUNT=50

run_rate=$(printf  "%.2f" `echo "scale=2;100/$RUN_TIMES"|bc`)
display_rate=$(printf "%.2f" `echo "scale=2;$RUN_TIMES/100/$DISPLAY_COUNT"|bc`)

for i in `seq 0 $run_rate 100`
do
    b=''; for i in `seq $i`; do b+='#'; done
    printf "progress: [%-100s] %d%%\r" $b $i

    sleep 0.1

    if [ $? -ne 0 ]; then
        FAIL_COUNT+=1
    fi
done
echo
