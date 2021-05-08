#prepare
minikube stop
minikube delete
bash start_kube.sh
bash delete_all_images.sh
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

#phpmyadmin
kubectl delete deployment phpmyadmin-deployment
kubectl delete svc phpmyadmin-svc
docker build -t phpmyadmin_image srcs/phpmyadmin/
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml

#wordpress
kubectl delete deployment wp-deployment
kubectl delete svc wp-svc
docker build -t wp_image srcs/wordpress
kubectl apply -f srcs/wordpress/wordpress.yaml

minikube dashboard
