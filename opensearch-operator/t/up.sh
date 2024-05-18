alias k=kubectl
export CLUSTER_NAME=opensearch-operator-tests
## Check disk to avoid failed shard assignments due to watermarking
df -h
cd opensearch-operator
## Prepare kubeconfig
k3d kubeconfig get $CLUSTER_NAME > functionaltests/kubeconfig
export KUBECONFIG=$(pwd)/functionaltests/kubeconfig
## Build controller docker image
make docker-build
## Import controller docker image
k3d image import -c $CLUSTER_NAME controller:latest
