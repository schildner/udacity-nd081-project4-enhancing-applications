#!/bin/bash

# Variables
resourceGroup="nd081-project-04-azure-performance"
clusterName="udacity-cluster"

# Install aks cli
# echo "Installing AKS CLI"
# sudo az aks install-cli
# echo "AKS CLI installed"

# Create AKS cluster
echo "Step 1 - Creating AKS cluster $clusterName"
# Use either one of the "az aks create" commands below
# For users working in their personal Azure account
az aks create \
--resource-group $resourceGroup \
--name $clusterName \
--node-count 1 \
--enable-addons monitoring \
--generate-ssh-keys

echo "AKS cluster created: $clusterName"

# Connect to AKS cluster

echo "Step 2 - Getting AKS credentials"

az aks get-credentials \
--resource-group $resourceGroup \
--name $clusterName \
--verbose

echo "Verifying connection to $clusterName"

kubectl get nodes

# echo "Deploying to AKS cluster"
# The command below will deploy a standard application to your AKS cluster.
# kubectl apply -f azure-vote.yaml