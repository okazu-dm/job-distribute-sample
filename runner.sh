#!/bin/bash

JOB_NAME=$1
INDEX=$2
SHARED_DIR=$3

TIME=$(date +%s)
set -x
    OUTDIR=$SHARED_DIR/output/$JOB_NAME
    mkdir -p "$OUTDIR"
    "$SHARED_DIR/artifacts/$JOB_NAME" < "$SHARED_DIR/input/$INDEX.txt" > "$OUTDIR/$INDEX.txt"
    if [ "$INDEX" = "1" ]; then
        echo "$SHARED_DIR/artifacts/$JOB_NAME" > "$OUTDIR/command.txt"
    fi
    echo "$TIME: $*" >> "$OUTDIR/$INDEX.txt"
set +x