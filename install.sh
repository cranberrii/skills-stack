#!/usr/bin/env bash
# Install the full skills stack from upstream sources.
# Pass -a flags through to target specific agents, e.g.: ./install.sh -a claude-code -a codex
set -euo pipefail

for repo in \
  mattpocock/skills \
  obra/superpowers \
  safishamsi/graphify \
  juliusbrussee/caveman \
  wandb/weave-integration-skills \
  forrestchang/andrej-karpathy-skills \
  vercel-labs/skills/skills/find-skills
do
  npx skills add "$repo" "$@"
done
