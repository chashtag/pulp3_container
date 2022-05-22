#!/bin/bash
STORAGE=/ssd/pulp

mkdir ${STORAGE}/{settings,pulp_storage/tmp,pgsql,containers} -p

echo "CONTENT_ORIGIN='http://$(hostname):8080'
ANSIBLE_API_HOSTNAME='http://$(hostname):8080'
ANSIBLE_CONTENT_HOSTNAME='http://$(hostname):8080/pulp/content'
TOKEN_AUTH_DISABLED=True
CACHE_ENABLED = True
REDIS_HOST = 'localhost'
REDIS_PORT = 6379

ALLOWED_CONTENT_CHECKSUMS = ['md5', 'sha1', 'sha224', 'sha256', 'sha384', 'sha512']" > ${STORAGE}/settings/settings.py

docker run -d --name pulp \
            --publish 8080:80 \
            --publish 9000:9000 \
            --volume "${STORAGE}/settings":/etc/pulp:Z \
            --volume "${STORAGE}/pulp_storage":/var/lib/pulp:Z \
            --volume "${STORAGE}/pgsql":/var/lib/pgsql:Z \
            --volume "${STORAGE}/containers":/var/lib/containers:Z \
            --device /dev/fuse \
            pulp/pulp
