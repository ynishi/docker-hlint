#!/bin/bash

docker build -t hlint .

docker run --rm -it hlint
