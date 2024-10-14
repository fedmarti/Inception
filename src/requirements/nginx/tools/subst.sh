#!/bin/bash

echo > $2

while read line
do
    eval echo \"$line\" >> $2;
done < $1
