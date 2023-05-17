#! /bin/bash

if [[ -z "${GRAFANA_DB_PASS}" ]]; then
    GRAFANA_DB_PASS="grafana"
fi

if [[ -z "${GRAFANA_ADMIN_PASS}" ]]; then
    GRAFANA_ADMIN_PASS="grafana"
fi

helmfile sync
kubectl apply -f project.yaml --context=docker-desktop
kubectl create namespace monitoring --context=docker-desktop
kubectl create secret generic local-grafana -n monitoring --context=docker-desktop  --from-literal=GF_DATABASE_USER=grafana \
    --from-literal=GF_SECURITY_ADMIN_USER=grafana \
    --from-literal=GF_DATABASE_PASSWORD="$GRAFANA_DB_PASS" \
    --from-literal=GF_SECURITY_ADMIN_PASSWORD="$GRAFANA_ADMIN_PASS"
kubectl apply -f bootstrap.yaml --context=docker-desktop

echo "Argo admin password is $(kubectl get secret argocd-initial-admin-secret -n argo --context=docker-desktop -o=jsonpath='{.data.password}' | base64 --decode)"
