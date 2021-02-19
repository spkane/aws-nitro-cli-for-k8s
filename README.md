# nitro-cli docker image

## Docker Test

### Anywhere

docker build -t spkane/nitro-cli:latest .
docker run -ti -v /var/run/docker.sock:/var/run/docker.sock spkane/nitro-cli:latest /enclave/build.sh

### On a Nitro Enclave enabled node

docker run -ti -v /var/run/docker.sock:/var/run/docker.sock --device=/dev/nitro_enclaves:/dev/nitro_enclaves spkane/nitro-cli:latest /enclave/build.sh run

# Kubernetes Test

### On a Nitro Enclave enabled node

Install the Smarter Device Manager on the Kubernetes cluster w/ custom config and tolerations:

* `kubectl apply -f k8s/smarter-device-manager-ds-with-cm.yaml`

* Label the enclave node:
  * `kubectl label node ${NODE_NAME} smarter-device-manager=enabled`

* Try to spin up a pod that is capable of spinning up an enclave.

* `kubectl apply -f k8s/hello-world-enclave-pod.yaml`