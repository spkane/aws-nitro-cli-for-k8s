# nitro-cli docker image

## Test

### Anywhere

docker build -t spkane/nitro-cli:latest .
docker run -ti -v /var/run/docker.sock:/var/run/docker.sock spkane/nitro-cli:latest /enclave/build.sh

### On a Nitro Enclave enabled node

docker run -ti -v /var/run/docker.sock:/var/run/docker.sock --device=/dev/nitro_enclaves:/dev/nitro_enclaves spkane/nitro-cli:latest /enclave/build.sh run
