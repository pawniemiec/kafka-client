#!/usr/bin/env sh

set +x

# Attach host network to allow DNS resolution via local DNS resolution service
docker run \
  --rm \
  --cpus=4 \
  --memory=16g \
  --memory-swap=0 \
  --memory-swappiness=0 \
  --net host \
  -ti kafka-client:dev \
  $@
