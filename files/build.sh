#!/bin/bash

run="${1}"

set -euxo pipefail

docker build -f ./hello/Dockerfile -t hello-world-nitro-enclave:1.0 ./hello
nitro-cli build-enclave --docker-uri hello-world-nitro-enclave:1.0 --output-file hello.eif

if [ "${run}" == "run" ]; then
  /enclave/run.sh
fi

