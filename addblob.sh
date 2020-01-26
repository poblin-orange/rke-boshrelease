#!/bin/bash
wget https://github.com/rancher/rke/releases/download/v1.0.2/rke_linux-amd64 -o src/rke_linux-amd64
bosh add-blob src/rke_linux-amd64 rke/rke

