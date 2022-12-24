kubectl apply -f .\mysql-deployment.yml --record
kubectl apply -f .\app-deployment.yml --record

echo "Processando imagens..."

docker build -t docker-hub-user/k8s-projeto2-app-backend:1.0 backend/.
docker build -t docker-hub-user/k8s-projeto2-app-database:1.0 database/.

echo "Fazendo upload das imagens..."

docker push docker-hub-user/k8s-projeto2-app-backend:1.0
docker push docker-hub-user/k8s-databas2-app-database:1.0

echo "Criando serviço no cluster k8s..."

kubectl apply -f ./services.yml

echo "Realizando deployment no cluster k8s..."

kubectl apply -f ./deployment.yml