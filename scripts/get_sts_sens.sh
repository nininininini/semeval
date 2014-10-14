#!/usr/bin/env bash
mkdir -p data/sts_trial/trial.sen
for file in $SEMEVAL_DATA/sts_trial/STS.input.*; do
    topic=`echo $file | cut -d'.' -f3`
    echo $topic
    c=0
    cat $file | while read line; do
        echo "$line" | tr '\t' '\n' | sed 's/$/\./g' | sed 's/\.\.$/\./g' > data/sts_trial/trial.sen/$topic.$c.sen
        (( c++ ))
    done
done
