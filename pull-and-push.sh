#!/usr/bin/env bash

set -ex

MAGMA_TAG=1.5.2
MAGMA_ARTIFACTORY=docker.artifactory.magmacore.org

DOCKER_REGISTRY=magmacore

for i in controller nginx magmalte gateway_python gateway_go cwag_go gateway_pipelined gateway_sessiond operator
do
  docker pull ${MAGMA_ARTIFACTORY}/${i}:${MAGMA_TAG}
  docker tag ${MAGMA_ARTIFACTORY}/${i}:${MAGMA_TAG} ${DOCKER_REGISTRY}/${i}:${MAGMA_TAG}
  docker push ${DOCKER_REGISTRY}/${i}:${MAGMA_TAG}
done
