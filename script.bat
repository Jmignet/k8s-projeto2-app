
echo "Processando imagem..."
docker build -t docker-hub-user/k8s-projeto2-app:1.0 app/.

echo "Fazendo upload da imagem..."
docker push docker-hub-user/k8s-projeto2-app:1.0

echo "Lendo secrets..."
kubectl apply -f ./secrets.yml
rm ./secrets.yml

echo "Criando load balancer no cluster k8s..."
kubectl apply -f .\load-balancer.yml --record

echo "Realizando deployment no cluster k8s..."
kubectl apply -f .\mysql-deployment.yml --record
kubectl apply -f .\app-deployment.yml --record
