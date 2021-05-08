# !/bin/bash

docker build -t wp_image .
kubectl apply -f wp.yaml
