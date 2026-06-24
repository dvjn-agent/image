# image

Derived container image: the official NousResearch Hermes Agent base plus the
GitHub CLI (`gh`), for the self-hosted `dage` gateway in the homelab cluster.

Published to `ghcr.io/dvjn-agent/image` by `.github/workflows/ci.yaml`. The base
image is pinned in the `Containerfile`; bump it via renovate.
