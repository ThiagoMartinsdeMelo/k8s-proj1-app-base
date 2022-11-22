#!/bin/bash

echo "Criando imagens..."

docker build -t thiagomelo42/projeto-backend:1.0 backend/.
docker build -t thiagomelo42/projeto-database:1.0 database/.

echo "Realizando o push das imagens..."

docker push thiagomelo42/projeto-backend:1.0
docker push thiagomelo42/projeto-database:1.0

echo "Criando serviços no cluster kubernets..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml
