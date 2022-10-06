#!/bin/sh

docker build -t luiidev/multi-client:latest -t luiidev/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t luiidev/multi-server:latest -t luiidev/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t luiidev/multi-worker:latest -t luiidev/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push luiidev/multi-client:latest
docker push luiidev/multi-client:$SHA
docker push luiidev/multi-server:latest
docker push luiidev/multi-server:$SHA
docker push luiidev/multi-worker:latest
docker push luiidev/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=luiidev/multi-client:$SHA
kubectl set image deployments/server-deployment server=luiidev/multi-server:$SHA
kubectl set image deployments/worker-deployment worker=luiidev/multi-worker:$SHA