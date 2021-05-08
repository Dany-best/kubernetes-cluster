# !/bin/bash
eval $(minikube docker-env)

docker build -t wp_image .
kubectl apply -f wp.yaml