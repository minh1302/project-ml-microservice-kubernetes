#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
dockerpath=minh1302/udacity-project-3

# Step 2
# Run the Docker Hub container with kubernetes
kubectl get nodes
kubectl create deploy udacity-project-3.0 --image=minh1302/udacity-project-3


# Step 3:
# List kubernetes pods
kubectl get deploy,rs,svc,pods

# Step 4:
# Forward the container port to a host
kubectl port-forward deployment/udacity-project-3.0 --address 0.0.0.0 8000:80
