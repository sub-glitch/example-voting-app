# Voting App: Ship It (Capstone 1)

## What this is
A voting app (vote, result, worker, Redis, PostgreSQL) containerized, provisioned on
Kubernetes with Terraform, built and scanned by GitHub Actions, and deployed with Helm.

## Architecture
(diagram added on Day 5)

## Run locally
    docker compose up --build
Vote: http://localhost:8080   Result: http://localhost:8081

## Security choices
- Base images pinned to exact versions, never `latest`
- Containers run as non-root (uid 10001)
- .dockerignore keeps .git, env files and tests out of images
- Images scanned with Trivy in CI before they are pushed
- No secrets in Git

## Deploy / Roll back / Destroy
(filled in on Days 2 to 5)