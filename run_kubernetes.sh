#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=zhan430/udacity:predict

# Step 2
# Run the Docker Hub container with kubernetes
kubectl create deployment predict-node --image=$dockerpath

# Step 3:
# List kubernetes pods
kubectl get pods

# Step 4:
# Forward the container port to a host
kubectl expose deployment predict-node --type="NodePort" --port=80
kubectl port-forward service/predict-node 8000:80

