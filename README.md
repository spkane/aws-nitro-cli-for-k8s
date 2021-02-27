# nitro-cli docker image

## Docker Test

### Anywhere (docker)

```shell
docker build -t spkane/nitro-cli:latest .
docker run -ti -v /var/run/docker.sock:/var/run/docker.sock spkane/nitro-cli:latest /enclave/build.sh
```

### On a Nitro Enclave enabled node (docker)

```shell
docker run -ti -v /var/run/docker.sock:/var/run/docker.sock --device=/dev/nitro_enclaves:/dev/nitro_enclaves:rw spkane/nitro-cli:latest /enclave/build.sh run
```

## Kubernetes Test

### On a Nitro Enclave enabled node (k8s)

Install the Smarter Device Manager on the Kubernetes cluster w/ custom config and tolerations:

* `kubectl apply -f k8s/smarter-device-manager-ds-with-cm.yaml`

* Label the enclave node (**HINT**: `kubectl get nodes -o wide --show-labels`):
  * `kubectl label node ${NODE_NAME} smarter-device-manager=enabled`

* Try to spin up a pod that is capable of spinning up an enclave.

* `kubectl apply -f k8s/hello-world-enclave-pod.yaml`
  * If this doesn't get scheduled it is likely becuase the resource limits aren't being satisfied. Feel free to adjust memory and CPU as needed. The other possibility is that smarter-devices is not quite configured correctly in your environment.

* `kubectl exec -ti pod/hello-world-enclave -- /enclave/run.sh`
  * Watch as an enclave is hopefully run and then terminated.

* **NOTE**: If you want to be able to **build** Nitro EIF files in the pod, then you will need access to a docker server. There are multiple ways to do this, but please consider the security repercussions before taking this route.

