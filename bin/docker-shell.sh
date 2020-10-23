#!/bin/bash

docker run \
    --rm -it \
    -v $PWD:/app \
    hifi3dface /bin/bash
