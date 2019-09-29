#!/bin/bash

set -eux

docker build -t ynishi/docker-hlint:latest .
VERSION=$(docker run --rm -it hlint --numeric-version | grep -v master | sed -e 's/\r//g')
docker build -t ynishi/docker-hlint:${VERSION} .

docker push ynishi/docker-hlint:latest .
docker push ynishi/docker-hlint:${VERSION} .
