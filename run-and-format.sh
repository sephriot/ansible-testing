#!/bin/bash

rm -rf ./artifacts/apply/job_events/*
ansible-runner run -i apply --artifact-dir=artifacts . -p playbook_1_roles.yaml

cd ./artifacts/apply/job_events

for FILE in $(ls); do cat $FILE | jq > tmp; mv tmp $FILE; done

cd ../../../