#prepare
eval $(minikube docker-env);
minikube addons enable metallb

#nginx
kubectl delete svc nginx-svc
kubectl delete deployment nginx-deployment
docker build -t nginx_image srcs/nginx/
kubectl apply -f srcs/nginx/configmap.yaml
kubectl apply -f srcs/nginx/nginx.yaml;

#mysql
kubectl delete deployment mysql-deployment
kubectl delete svc mysql-svc
docker build -t mysql_image srcs/mysql/
kubectl apply -f srcs/mysql/mysql-deployment.yaml

#wordpress
kubectl delete deployment wp-deployment
kubectl delete svc wp-svc
docker build -t wp_image srcs/wordpress
kubectl apply -f srcs/wordpress/wordpress.yaml