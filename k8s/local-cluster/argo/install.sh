#! /bin/bash

set -eof
if [[ -z "${GRAFANA_DB_PASS}" ]]; then
    GRAFANA_DB_PASS="grafana"
fi

if [[ -z "${GRAFANA_ADMIN_PASS}" ]]; then
    GRAFANA_ADMIN_PASS="grafana"
fi

helmfile sync
kubectl apply -f project.yaml
kubectl create secret generic local-grafana --from-literal=GF_DATABASE_USER=grafana \
    --from-literal=GF_SECURITY_ADMIN_PASSWORD=grafana \
    --from-literal=GF_DATABASE_PASSWORD="$GRAFANA_DB_PASS" \
    --from-literal=GF_SECURITY_ADMIN_PASSWORD="$GRAFANA_ADMIN_PASS"
kubectl apply -f bootstrap.yaml
