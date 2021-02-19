#!/bin/bash

set -euxo pipefail

nitro-cli run-enclave --cpu-count 2 --memory 512 --eif-path hello.eif --debug-mode > /tmp/output.json
cat /tmp/output.json
EID=$(cat /tmp/output.json | jq -r .EnclaveID)

echo
echo "NOTE: This is a child of the container, so when the container dies this enclave will likely be killed as well."
echo

nitro-cli describe-enclaves

echo
echo "# Note: EnclaveCID is the VSOCKET ID for the Enclave"
echo '$ nitro-cli console --enclave-id ${EID}'
echo

nitro-cli terminate-enclave --enclave-id ${EID}
