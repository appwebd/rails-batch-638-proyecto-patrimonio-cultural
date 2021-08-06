#!/bin/bash
sonar-scanner \
  -Dsonar.projectKey=proyecto-patrimonio-cultural \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.login=a1dde426f0eaba1e0a3f778588751e39835ea0ba
