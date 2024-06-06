#!/usr/bin/env bash
K8S_VERSION=$(kubectl version -ojson | jq -r '.serverVersion.major + "." + .serverVersion.minor')
CRD_PATH=$(pwd)/crds/${K8S_VERSION}.yaml

kubectl get crd | awk '{ print $1 }' | egrep '.gke.io$' | xargs kubectl get crd -oyaml > ${CRD_PATH}

