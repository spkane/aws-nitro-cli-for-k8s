#!/bin/bash

run="${1}"

set -euxo pipefail

docker build -f ./hello/Dockerfile -t hello-enclave:1.0 ./hello
nitro-cli build-enclave --docker-uri hello-enclave:1.0 --output-file hello.eif

if [ "${run}" == "run" ]; then
  /enclave/run.sh
fi

