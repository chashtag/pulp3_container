# Pulp 3 Containers

based on work from [Pulp in One Container](https://pulpproject.org/pulp-in-one-container/).

# Build instructions

```bash
$ wget https://github.com/just-containers/s6-overlay/releases/download/v1.22.1.0/s6-overlay-`uname -m`.tar.gz
$ <docker build | buildah bud> --file pulp_ci_centos/Containerfile --tag pulp/pulp-ci-centos:latest .
$ <docker build | buildah bud> --file pulp/Containerfile --tag pulp/pulp:latest .
$ <docker build | buildah bud> --file pulp_galaxy_ng/Containerfile --tag pulp/pulp-galaxy-ng:latest .
```

