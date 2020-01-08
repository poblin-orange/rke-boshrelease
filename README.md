# BOSH release for rke

This BOSH release and deployment manifest deploy a cluster of rke.

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
