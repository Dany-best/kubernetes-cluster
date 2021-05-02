#prepare
eval $(minikube docker-env);
minikube addons enable metallb
bash delete_all_images.sh

#nginx
kubectl delete svc nginx-svc
kubectl delete deployment nginx-deployment
docker build -t nginx nginx/
kubectl apply -f nginx/configmap.yaml
kubectl apply -f nginx/nginx.yaml;

#mysql
kubectl delete deployment mysql-deployment
kubectl delete svc mysql-svc
docker build -t mysql mysql/
kubectl apply -f mysql/mysql-deployment.yaml

