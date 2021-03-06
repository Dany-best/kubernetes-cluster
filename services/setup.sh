#prepare
minikube stop
minikube delete
kubectl delete --all svc;
kubectl delete --all deployments;
kubectl delete --all pods;
minikube start --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=50G
docker rmi $(docker images -a -q);
eval $(minikube docker-env);

#if metallb doesn't issue ip
docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2

minikube addons enable metallb

#nginx
kubectl delete svc nginx-svc;
kubectl delete deployment nginx-deployment;
docker build -t nginx_image srcs/nginx/;
kubectl apply -f srcs/nginx/configmap.yaml;
kubectl apply -f srcs/nginx/nginx.yaml;

#mysql
kubectl delete deployment mysql-deployment;
kubectl delete svc mysql-svc;
docker build -t mysql_image srcs/mysql/;
kubectl apply -f srcs/mysql/mysql-deployment.yaml;

#phpmyadmin
kubectl delete deployment phpmyadmin-deployment;
kubectl delete svc phpmyadmin-svc;
docker build -t phpmyadmin_image srcs/phpmyadmin/;
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml;

#wordpress
kubectl delete deployment wp-deployment;
kubectl delete svc wp-svc;
docker build -t wp_image srcs/wordpress;
kubectl apply -f srcs/wordpress/wordpress.yaml;

#ftps
kubectl delete deployment ftps-deployment;
kubectl delete svc ftps-svc;
docker build -t ftps_image srcs/ftps;
kubectl apply -f srcs/ftps/ftps.yaml;

#grafana
kubectl delete deployment grafana-deployment;
kubectl delete svc grafana-svc;
docker build -t grafana_image srcs/grafana;
kubectl apply -f srcs/grafana/grafana.yaml;

#influxdb
kubectl delete deployment influxdb-deployment;
kubectl delete svc influxdb-svc;
docker build -t influxdb_image srcs/influxdb;
kubectl apply -f srcs/influxdb/influxdb.yaml;

minikube dashboard
