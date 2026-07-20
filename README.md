# skills-stack

My agent skills setup — every skill and plugin I find helpful for my workflow, grouped by creator with links back to the original source repos. Nothing is vendored here: install commands pull each skill fresh from upstream.

Skills are plain folders containing a `SKILL.md` (plus optional resources), so they work with any agent that reads the [Agent Skills](https://agentskills.io) format: Claude Code, Codex, Cursor, OpenCode, Amp, Gemini CLI, Droid, and ~70 others.

## Install

### Any agent, via the skills CLI (recommended)

The [skills CLI](https://github.com/vercel-labs/skills) auto-detects which coding agents you have installed and puts each skill in the right place. One command installs everything:

```bash
./install.sh                          # all skills, all detected agents
./install.sh -a claude-code -a codex  # or target specific agents
```

Or pick individual sources:

```bash
npx skills add mattpocock/skills              # Matt Pocock's engineering + writing skills
npx skills add obra/superpowers               # Jesse Vincent's process skills
npx skills add safishamsi/graphify            # knowledge graphs
npx skills add juliusbrussee/caveman          # compressed output mode
npx skills add wandb/weave-integration-skills # W&B Weave tracing
npx skills add forrestchang/andrej-karpathy-skills
npx skills add vercel-labs/skills/skills/find-skills
```

Target specific agents with `-a` (repeatable):

```bash
npx skills add mattpocock/skills -a claude-code -a codex -a opencode
```

### Claude Code plugins

`superpowers`, `feature-dev`, `code-simplifier`, `claude-md-management`, `frontend-design`, `context7`, and `playwright` are also available as Claude Code plugins from the official marketplace:

```
/plugin install superpowers@claude-plugins-official
```

Ponytail installs from its own marketplace:

```
/plugin marketplace add DietrichGebert/ponytail
/plugin install ponytail@ponytail
```

### Agents without skills support (Devin, etc.)

A skill is just a markdown file. Copy the skill folder's `SKILL.md` content into whatever persistent context the agent supports — Devin's Knowledge/Playbooks, a `AGENTS.md` section, or the agent's custom-instructions field.

## Skills

### Matt Pocock

**Source:** [mattpocock/skills](https://github.com/mattpocock/skills) — "Skills for Real Engineers. Straight from my .claude directory."

| Skill | Description |
|---|---|
| `setup-matt-pocock-skills` | One-time repo setup (issue tracker, triage labels, doc layout) for the engineering skills below |
| `tdd` | Test-driven development: red-green-refactor, one vertical slice at a time |
| `diagnose` / `diagnosing-bugs` | Disciplined diagnosis loop: reproduce → minimise → hypothesise → instrument → fix → regression-test |
| `grilling` / `grill-me` / `grill-with-docs` | Relentless interview to stress-test a plan or design (with-docs variant also writes ADRs and a glossary) |
| `to-issues` | Break a plan/spec/PRD into independently-grabbable tracer-bullet issues |
| `to-prd` | Turn the current conversation into a PRD on the issue tracker |
| `triage` | Move issues and external PRs through triage roles into agent-ready briefs |
| `implement` | Implement a piece of work from a PRD or set of issues |
| `qa` | Conversational QA session that files GitHub issues as you report bugs |
| `review` | Review changes since a fixed point along Standards and Spec axes, in parallel sub-agents |
| `request-refactor-plan` | Interview-driven refactor plan with tiny commits, filed as a GitHub issue |
| `improve-codebase-architecture` | Scan for deepening opportunities, present as visual HTML report, grill through picks |
| `codebase-design` | Shared vocabulary for designing deep modules |
| `design-an-interface` | Generate radically different interface designs via parallel sub-agents ("design it twice") |
| `domain-modeling` | Build and sharpen a project's domain model |
| `ubiquitous-language` | Extract a DDD-style glossary from the conversation |
| `decision-mapping` | Turn a loose idea into sequenced investigation tickets |
| `zoom-out` | Step back and look at the bigger picture of the codebase |
| `prototype` | Throwaway prototype to flesh out a design |
| `handoff` | Compact the conversation into a handoff document for another agent |
| `teach` | Teach a new skill or concept within the workspace |
| `resolving-merge-conflicts` | Resolve in-progress git merge/rebase conflicts |
| `git-guardrails-claude-code` | PreToolUse hooks that block dangerous git commands (push, reset --hard, clean, branch -D) |
| `scaffold-exercises` | Scaffold course exercise structures with problems, solutions, explainers |
| `write-a-skill` / `writing-great-skills` | Create new agent skills with proper structure and progressive disclosure |
| `writing-fragments` | Grilling session that mines you for raw writing fragments |
| `writing-shape` | Shape raw material into an article, paragraph by paragraph |
| `writing-beats` | Assemble an article as a journey of beats, choose-your-own-adventure style |
| `edit-article` | Edit and improve article drafts |

### Jesse Vincent (obra)

**Source:** [obra/superpowers](https://github.com/obra/superpowers) — installed as the `superpowers` plugin via [anthropics/claude-plugins-official](https://github.com/anthropics/claude-plugins-official)

| Skill | Description |
|---|---|
| `using-superpowers` | Establishes how to find and use skills at conversation start |
| `brainstorming` | Explore intent, requirements, and design before any creative work |
| `writing-plans` | Write implementation plans from a spec before touching code |
| `executing-plans` | Execute a written plan with review checkpoints |
| `test-driven-development` | Write the test before the implementation, always |
| `systematic-debugging` | Root-cause discipline before proposing fixes |
| `subagent-driven-development` | Execute plans with independent tasks via subagents |
| `dispatching-parallel-agents` | Parallelize 2+ independent tasks |
| `using-git-worktrees` | Isolated workspaces for feature work |
| `requesting-code-review` | Verify work meets requirements before merge |
| `receiving-code-review` | Rigorously verify review feedback before implementing it |
| `verification-before-completion` | Evidence before claiming anything works |
| `finishing-a-development-branch` | Structured merge/PR/cleanup options when work is done |
| `writing-skills` | Create and verify new skills |

### Forrest Chang

**Source:** [forrestchang/andrej-karpathy-skills](https://github.com/forrestchang/andrej-karpathy-skills)

| Skill | Description |
|---|---|
| `karpathy-guidelines` | Behavioral guidelines distilled from Andrej Karpathy to reduce common LLM coding mistakes: surgical changes, surfaced assumptions, verifiable success criteria |

### Dietrich Gebert

**Source:** [DietrichGebert/ponytail](https://github.com/DietrichGebert/ponytail)

| Skill | Description |
|---|---|
| `ponytail` | Forces the laziest solution that works: YAGNI, stdlib first, shortest diff (lite/full/ultra) |
| `ponytail-review` | Code review hunting only over-engineering — what to delete |
| `ponytail-audit` | Whole-repo over-engineering audit |
| `ponytail-debt` | Harvest `ponytail:` shortcut comments into a debt ledger |
| `ponytail-gain` | Scoreboard of ponytail's measured savings |
| `ponytail-help` | Quick-reference card for all ponytail commands |

### Julius Brussee

**Source:** [JuliusBrussee/caveman](https://github.com/JuliusBrussee/caveman)

| Skill | Description |
|---|---|
| `caveman` | Ultra-compressed communication mode — cuts output tokens ~65-75% while keeping full technical accuracy |

### Safi Shamsi

**Source:** [safishamsi/graphify](https://github.com/safishamsi/graphify)

| Skill | Description |
|---|---|
| `graphify` | Turn any folder (code, docs, papers, images, videos) into a queryable knowledge graph — tree-sitter AST extraction, community detection, interactive HTML + GraphRAG JSON output |

### Vercel Labs

**Source:** [vercel-labs/skills](https://github.com/vercel-labs/skills)

| Skill | Description |
|---|---|
| `find-skills` | Discover and install skills from the open agent skills ecosystem (`npx skills`) |

### Weights & Biases

**Source:** [wandb/weave-integration-skills](https://github.com/wandb/weave-integration-skills)

| Skill | Description |
|---|---|
| `weave-integration` | Add W&B Weave observability/LLM tracing to existing apps: trace-first instrumentation, then evals |

### Anthropic (official plugins)

**Source:** [anthropics/claude-plugins-official](https://github.com/anthropics/claude-plugins-official)

| Plugin | Skills / tools |
|---|---|
| `feature-dev` | `feature-dev` guided feature development, plus code-architect / code-explorer / code-reviewer agents |
| `code-simplifier` | Agent that simplifies code while preserving functionality |
| `claude-md-management` | `revise-claude-md`, `claude-md-improver` — keep CLAUDE.md files healthy |
| `frontend-design` | Distinctive, intentional visual design for new UI |
| `context7` | Up-to-date library docs via the [Context7](https://github.com/upstash/context7) MCP server |
| `playwright` | Browser automation via the [Playwright MCP](https://github.com/microsoft/playwright-mcp) server |

### Anthropic (built into Claude Code)

These ship with Claude Code itself — nothing to clone: `dataviz`, `artifact-design`, `artifact-capabilities`, `update-config`, `keybindings-help`, `verify`, `run`, `code-review`, `review` (PR review), `security-review`, `simplify`, `fewer-permission-prompts`, `loop`, `schedule`, `claude-api`, `init`.

## Additional references

- [affaan-m/ECC](https://github.com/affaan-m/ECC/tree/main) — agent harness performance optimization system: skills, instincts, memory, security, and research-first development for Claude Code, Codex, Opencode, Cursor and beyond
- [garrytan/gstack](https://github.com/garrytan/gstack) — Garry Tan's Claude Code setup: 23 opinionated tools serving as CEO, Designer, Eng Manager, Release Manager, Doc Engineer, and QA

## License

This repo (README, install script) is [MIT](LICENSE). Each linked skill remains under its own upstream license — check the source repo before redistributing.
