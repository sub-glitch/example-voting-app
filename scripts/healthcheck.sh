#!/usr/bin/env bash
# Run this morning and evening while the cluster is up for 3 days.
set -uo pipefail
echo "== Nodes =="; kubectl get nodes
echo; echo "== Pods NOT Running/Completed (should be empty) =="
kubectl get pods -A --no-headers | grep -v -E "Running|Completed" || echo "none"
echo; echo "== Restarts above 3 =="
kubectl get pods -A --no-headers | awk '$5+0 > 3 {print}' || true
echo; echo "== PVCs =="; kubectl get pvc -A
echo; echo "== Node usage =="; kubectl top nodes 2>/dev/null || echo "metrics-server not ready"
echo; echo "== Public endpoints =="
kubectl get svc -A --no-headers | grep LoadBalancer | awk '{print $1"/"$2" -> "$5}'
echo; echo "== Helm releases =="; helm list -A
