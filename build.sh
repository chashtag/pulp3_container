#!/bin/bash

if [[ ! -f "./s6-overlay-`uname -m`.tar.xz" ]]
then
    wget https://github.com/just-containers/s6-overlay/releases/download/v3.1.0.1/s6-overlay-`uname -m`.tar.xz
fi

docker buildx build --file pulp_ci_centos/Containerfile --tag pulp/pulp-ci-centos:latest . --build-arg ARCH=`uname -m`
docker buildx build --file pulp/Containerfile --tag pulp/pulp:latest .
#docker buildx build --file pulp_galaxy_ng/Containerfile --tag pulp/pulp-galaxy-ng:latest .

