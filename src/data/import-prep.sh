#!/usr/bin/env bash
# Because surnames-1990.txt apparently isn't tab-delimted, it's multi-space delimited
(>&2 echo "Converting surnames-1990.txt from multi-space-delimted to comma-delimited")
cat ./data/raw/surnames-1990.txt \
    | tr -s '[:blank:]' ',' \
    > ./data/raw/surnames-1990.csv

