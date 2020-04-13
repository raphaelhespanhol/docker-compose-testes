#!/usr/bin/env bash
source /etc/environment; rm -rf docker-compose.yml; envsubst < "template-docker-compose.yml" > "docker-compose.yml";
