#!/usr/bin/env bash

SINGLE_DATES=$(grep -lr "// Copyright (C) [0-9]* AXIA Technologies (UK) Ltd.")
YEAR=$(date +%Y)

for file in $SINGLE_DATES; do
  FILE_YEAR=$(cat $file | sed -n "s|// Copyright (C) \([[:digit:]][[:digit:]][[:digit:]][[:digit:]]\) AXIA Technologies (UK) Ltd.|\1|p")
  if [ $YEAR -ne $FILE_YEAR ]; then
    sed -i -e "s|// Copyright (C) \([[:digit:]][[:digit:]][[:digit:]][[:digit:]]\) AXIA Technologies (UK) Ltd.|// Copyright (C) \1-$YEAR AXIA Technologies (UK) Ltd.|g" $file
  fi
done

grep -lr "// Copyright (C) [0-9]*-[0-9]* AXIA Technologies (UK) Ltd." |
  xargs sed -i -e "s|// Copyright (C) \([[:digit:]][[:digit:]][[:digit:]][[:digit:]]\)-[[:digit:]][[:digit:]][[:digit:]][[:digit:]] AXIA Technologies (UK) Ltd.|// Copyright (C) \1-$YEAR AXIA Technologies (UK) Ltd.|g"
