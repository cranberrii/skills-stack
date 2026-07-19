# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

A curated inventory of agent skills and plugins, not a codebase. Nothing is vendored: `README.md` catalogs each skill grouped by creator with links to upstream source repos, and `install.sh` installs them fresh from upstream via `npx skills add`.

## The two files that matter

- `README.md` — the catalog. Skills grouped by creator, one table per source repo.
- `install.sh` — loops over the upstream repos and runs `npx skills add <repo> "$@"` (extra args like `-a claude-code` pass through to target specific agents).

## Keeping them in sync

When adding or removing a skill source, update both:
1. the repo list in `install.sh`
2. the corresponding section/table and the "pick individual sources" command list in `README.md`

Claude Code plugins (superpowers, feature-dev, ponytail, etc.) install via `/plugin install`, not the skills CLI — they belong only in the README's plugin sections, not in `install.sh`.

## Testing

There is no build or test suite. To verify `install.sh` changes: `bash -n install.sh` for syntax; actually running it installs skills into the user's agent config dirs.
