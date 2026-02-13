#!/bin/bash
set -e

BACKEND_IMAGE=$1
FRONTEND_IMAGE=$2

kubectl apply -k k8s/base

kubectl set image deployment/wanderlust-backend \
    backend=$BACKEND_IMAGE -n wanderlust

kubectl set image deployment/wanderlust-frontend \
    frontend=$FRONTEND_IMAGE -n wanderlust

kubectl rollout status deployment/wanderlust-backend -n wanderlust
kubectl rollout status deployment/wanderlust-frontend -n wanderlust

echo "Deployment Completed"
