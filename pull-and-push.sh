#!/usr/bin/env bash

set -ex

MAGMA_TAG=1.7
MAGMA_TAG_EXTRA=.0
MAGMA_ARTIFACTORY=docker-test.artifactory.magmacore.org
DOCKER_REGISTRY=magmacore

for i in controller nginx magmalte gateway_python gateway_go cwag_go gateway_pipelined gateway_sessiond agw_gateway_c agw_gateway_python ghz_gateway_c ghz_gateway_python
do
  docker pull ${MAGMA_ARTIFACTORY}/${i}:${MAGMA_TAG}
  docker tag ${MAGMA_ARTIFACTORY}/${i}:${MAGMA_TAG} ${DOCKER_REGISTRY}/${i}:${MAGMA_TAG}${MAGMA_TAG_EXTRA}
  docker push ${DOCKER_REGISTRY}/${i}:${MAGMA_TAG}${MAGMA_TAG_EXTRA}
done
