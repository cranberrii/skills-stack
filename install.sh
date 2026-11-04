#!/usr/bin/env bash
# Install the full skills stack from upstream sources.
# Defaults to Claude Code + Pi. Pass your own -a flags to override, e.g.: ./install.sh -a codex
set -euo pipefail

[ $# -eq 0 ] && set -- -a claude-code -a pi

for repo in \
  cranberrii/skills-stack \
  mattpocock/skills \
  obra/superpowers \
  safishamsi/graphify \
  juliusbrussee/caveman \
  ai-evals-course/evals-skills \
  cloudflare/security-audit-skill \
  forrestchang/andrej-karpathy-skills \
  vercel-labs/skills/skills/find-skills
do
  npx skills add "$repo" "$@"
done
