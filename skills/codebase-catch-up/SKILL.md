---
name: codebase-catch-up
description: Brief me on what changed in this repo since I last looked — summary, review, and what to work on next.
disable-model-invocation: true
---

# Catch-up

Deliver a **briefing** on the repo's latest updates: three sections — **What landed**, **Review**, **Next** — nothing else.

## 1. Baseline

- `git fetch --all --prune` (skip silently if no remote or offline).
- The **tip** is `git rev-parse @{u} 2>/dev/null || git rev-parse HEAD` — upstream when it exists, else local HEAD.
- The **baseline** is the SHA in `.git/catch-up-baseline` if present; otherwise the most recent tag, or `git rev-list --max-count=21 <tip> | tail -1` (≈ 20 back, clamped to the root commit) — say which fallback you used.
- If invoked with an argument — a count `N` or a ref — this is an **explicit lookback**: the baseline is `git rev-list --max-count=$((N+1)) <tip> | tail -1` (or the given ref), the stored baseline is ignored, and step 4 is skipped (a one-off view never moves the marker).
- The **delta** is `<baseline>..<tip>`.
- Empty delta → report "nothing new since `<sha>` (`<date>`)", then still report working-tree state (below) if dirty, and stop.

## 2. Gather

- `git log --oneline --stat <delta>`; `git status --short` for working-tree state; `gh pr list` for open PRs if `gh` is available (skip silently otherwise).
- Read the full diff of any commit whose message doesn't make its change obvious.
- **Done when:** every commit in the delta is assigned to a theme — no "misc" bucket larger than 3 commits.

## 3. Briefing

- **What landed** — commits grouped by theme; each theme gets one line: what it does, commit count, key files.
- **Review** — judgments from the diffs you read: risks introduced, missing tests, contract/doc drift, half-finished work (TODOs, dead flags, stubs). If the working tree is dirty, name what's uncommitted. Every claim cites a commit or `file:line`. No diff read → no claim.
- **Next** — 3–5 ranked recommendations, each traceable to something observed (a gap the commits opened, a follow-up they imply, uncommitted work in the tree, an open PR going stale). No generic advice.
- **Done when:** each Review claim has a citation and each Next item names its evidence.

## 4. Advance

Write the delta's tip SHA to `.git/catch-up-baseline` — only after delivering the briefing, so a failed run re-covers the same delta.
