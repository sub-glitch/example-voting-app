#!/usr/bin/env bash
# Order matters: delete Services (load balancers) and PVCs (EBS volumes) BEFORE terraform destroy,
# otherwise they are orphaned, keep costing money and can block the destroy.
set -uo pipefail

helm list -A --no-headers | awk '{print $1, $2}' | while read -r name ns; do
  echo ">> helm uninstall $name -n $ns"
  helm uninstall "$name" -n "$ns" --wait --timeout 3m || true
done

kubectl delete pvc --all -A --wait=true --timeout=180s || true
echo ">> waiting 60s for AWS to remove the load balancers"
sleep 60

cd "$(dirname "$0")/../terraform" && terraform destroy
