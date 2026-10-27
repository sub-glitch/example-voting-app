#!/usr/bin/env bash
# Live rollback demo. Run it step by step in front of the examiner.
set -euo pipefail
NS=voting
REL=voting

echo "== 1. Current good release =="
helm history "$REL" -n "$NS"
kubectl get pods -n "$NS"
read -rp "Press Enter to ship a BAD release..."

echo "== 2. Bad release: image tag that does not exist (NOT atomic, so it stays visible) =="
helm upgrade "$REL" helm/voting -n "$NS" --reuse-values --set vote.image.tag=does-not-exist
sleep 20
kubectl get pods -n "$NS" -l app.kubernetes.io/name=vote     # new pod: ErrImagePull / ImagePullBackOff
helm history "$REL" -n "$NS"
read -rp "Press Enter to roll back..."

echo "== 3. Rollback to the previous revision =="
helm rollback "$REL" -n "$NS" --wait --timeout 3m
kubectl get pods -n "$NS" -l app.kubernetes.io/name=vote
helm history "$REL" -n "$NS"
