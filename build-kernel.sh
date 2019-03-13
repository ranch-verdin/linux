#!/usr/bin/env bash
set -x -e

# Make sure we have the latest version of the image
docker pull simonvanderveldt/rpi3-kernel-builder

# run build
docker run --rm -ti \
  -v "${PWD}":/workdir \
  -e DEFCONFIG=norns_defconfig \
  --cpus 16 \
  -e MAKEFLAGS=-j16 \
  simonvanderveldt/rpi3-kernel-builder /bin/bash
