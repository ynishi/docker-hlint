#!/bin/bash

set -eux

VERSION=$(cd hlint && git branch | awk '/\*/ { print $2; }' | grep -v master)

docker build --cache-from builder -t ynishi/docker-hlint:latest .
docker build --cache-from builder -t ynishi/docker-hlint:${VERSION} .

docker push ynishi/docker-hlint:latest .
docker push ynishi/docker-hlint:${VERSION} .
