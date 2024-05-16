#!/bin/bash

kubectl apply -f statefulset.yaml --wait
kubectl rollout status --watch --timeout=600s statefulset/ssh-server
cp inventory.yaml.template inventory.yaml
for I in $(seq 0 2); do
  POD_IP=$(kubectl get pod "ssh-server-${I}" -o json | jq -r .status.podIP)
  sed -i .bak "s/ansible_host_${I}/${POD_IP}/g" inventory.yaml
done
