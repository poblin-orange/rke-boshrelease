#!/bin/bash
wget https://github.com/rancher/rke/releases/download/v1.0.0/rke_linux-amd64
bosh add-blob rke_linux-amd64 rke/rke
#wget https://get.helm.sh/${HELM_FILE}
#bosh add-blob ${HELM_FILE} helm/helm.tar.gz

rm rke_linux-amd64 
