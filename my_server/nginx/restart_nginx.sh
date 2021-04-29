kubectl delete pod nginx;
eval $(minikube docker-env);
minikube addons enable metallb;
docker build -t nginx_image . ;
kubectl apply -f configmap.yaml
kubectl apply -f nginx.yaml;


