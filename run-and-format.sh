#!/bin/bash

rm -rf ./artifacts/apply/job_events/*
# ansible-runner run -i apply --artifact-dir=artifacts . -p "${1}" --inventory inventory_local.yaml -v
# --cmdline="--check --diff"
ansible-runner run -i apply --artifact-dir=artifacts . -p "${1}" --inventory inventory_local.yaml -v --cmdline=" --diff"
echo "Exit code: $?"
cd ./artifacts/apply/job_events

for FILE in $(ls); do cat $FILE | jq > tmp; mv tmp $FILE; done

cd ../../../