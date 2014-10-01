#!/bin/bash

for f in `ls $1/*.path`; do
  res=`echo "\`tail -n 1 $f | awk -F, '{print $5}'\` > 20" | bc`
  if [[ $res -eq '1' ]]; then
    echo $f
  fi
done

exit 0

