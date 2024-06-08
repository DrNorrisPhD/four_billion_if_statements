#!/bin/bash

input1=$(wc -l $1)
sleep 10
input2=$(wc -l $1)
count1=${input1%% *}
count2=${input2%% *}
count3=$(($count2 % $count1))
printf '%s lines per second' "$(($count3/10))"
exit 0
