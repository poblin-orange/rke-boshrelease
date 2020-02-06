# BOSH release for rke

This BOSH release and deployment manifest deploy a cluster of rke.
Rancher Kubernetes Engine (RKE), an extremely simple, lightning fast Kubernetes distribution that runs entirely within containers. 
https://github.com/rancher/rke


## design overview

Provide a lightweight bosh packaging of Rancher RKE kubernetes distribution
Depends on:
- docker bosh release
- jumbox bosh release

Includes
- Rancher rke binary


The bosh release offers 3 jobs to build a full rke bosh deployment:
- master jobs. must be associated with docker bosh release and jumbox bosh release on instance_group
- worker jobs. must be associated with docker bosh release and jumbox bosh release on instance_group
- management jobs: This jobs holds the reke binary and cluster.yml generation from bosh spec properties. It relies on bosh lifecycle (pre-start, post-deploy) to provision rke via ssh on master and worker nodes, and uses bosh links to configure masters and workers ips.


## Usage

This repository includes base manifests and operator files. They can be used for initial deployments and subsequently used for updating your deployments:

```plain
export BOSH_ENVIRONMENT=<bosh-alias>
export BOSH_DEPLOYMENT=rke
git clone https://github.com/cloudfoundry-community/rke-boshrelease.git
bosh deploy rke-boshrelease/manifests/rke.yml
```

If your BOSH does not have Credhub/Config Server, then remember `--vars-store` to allow generation of passwords and certificates.

### Update

When new versions of `rke-boshrelease` are released the `manifests/rke.yml` file will be updated. This means you can easily `git pull` and `bosh deploy` to upgrade.

```plain
export BOSH_ENVIRONMENT=<bosh-alias>
export BOSH_DEPLOYMENT=rke
cd rke-boshrelease
git pull
cd -
bosh deploy rke-boshrelease/manifests/rke.yml
```
