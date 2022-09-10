#!/usr/bin/env bash

set -ex

MAGMA_TAG=1.8.0
NEW_MAGMA_TAG=1.8.0
MAGMA_ARTIFACTORY=docker.artifactory.magmacore.org
DOCKER_REGISTRY=magmacore

for i in controller magmalte nginx active-mode-controller configuration-controller radio-controller db-service gateway_go gateway_python agw_gateway_c agw_gateway_python ghz_gateway_c ghz_gateway_python cwag_go gateway_go gateway_pipelined gateway_python gateway_sessiond operator
do
  docker pull ${MAGMA_ARTIFACTORY}/${i}:${MAGMA_TAG}
  docker tag ${MAGMA_ARTIFACTORY}/${i}:${MAGMA_TAG} ${DOCKER_REGISTRY}/${i}:${NEW_MAGMA_TAG}
  docker push ${DOCKER_REGISTRY}/${i}:${NEW_MAGMA_TAG}
done
