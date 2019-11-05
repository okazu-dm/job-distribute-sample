#!/bin/bash
# shellcheck disable=SC2016
# shellcheck disable=SC2001

PARALLELS=$1
JOB_NAME=$2
POD_NAME_PREFIX=$3
RUNNER_IMAGE=foo

MANIFEST_TEMPLATE=$(sed -e "s|%SHARED_PATH%|$PWD/shared|g"  ./pod-template.json)


for i in $(seq 1 "$PARALLELS"); do
    MANIFEST=$(echo "$MANIFEST_TEMPLATE" | sed -e "s|%JOB_NAME%|$JOB_NAME|");
    MANIFEST=$(echo "$MANIFEST" | sed -e "s|%ARG%|$i|");
    MANIFEST=$(echo "$MANIFEST" | sed -e "s|%INDEX%|$i|");
    echo $MANIFEST
    kubectl run "${POD_NAME_PREFIX}-${i}" --generator=run-pod/v1  --image $RUNNER_IMAGE --overrides="${MANIFEST}";
done
