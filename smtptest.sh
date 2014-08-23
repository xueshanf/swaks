#!/bin/bash
export SHELL=/bin/bash

# Define SERVER, FROM, TO, RUNS, and JOBS as ENV.
# Example:
# docker run -e SERVER=smtp.example.com -e FROM=me@example.com -e TO:you@example.com -e RUNS=100 -e JOBS=3 <imageId>

if [[ -z "$SERVER" ]] || [[ -z "$FROM" ]] || [[ -z "$TO" ]] || \
   [[ -z "$RUNS" ]] || [[ -z "JOBS" ]]; then
    echo "SERVER, FROM, TO, RUNS, or JOBS are missing"
    ecoh "Usage: docker run -n <fqdn> -e SERVER=smtp.example.com -e FROM=me@example.com -e TO:you@example.com -e RUNS=100 -e JOBS=3 <imageId>"
    exit 1
else
    server=$SERVER
    from=$FROM
    to=$TO
    runs=$RUNS
    jobs=$JOBS
fi

swakscmd="swaks --tls-optional --server $server --from $from --to $to"

seq $runs | parallel -j$jobs -n0 $swakscmd :::
