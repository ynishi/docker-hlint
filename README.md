# docker-hlint
docker image for hlint command.

* based on stack-build for build, alpine for binary.
* version 2.2.2_lts-14.6_alpine3.10.2 ${hlint version}\_${stack lts version}\_${base image version}

## Usage
### run
```
docker run --rm -it -v $(pwd):/data ynishi/docker-hlint /data
```
### sh in container
```
docker run --rm -it --entrypoint=sh ynishi/docker-hlint
```
### build(local)
support cache build stage image.
```
sudo sh build.sh
```

## License
MIT, see LICENSE.
