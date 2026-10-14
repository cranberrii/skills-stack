# skills-stack

My agent skills setup — every skill and plugin I find helpful for my workflow, grouped by creator with links back to the original source repos. Install commands pull each skill fresh from upstream.

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
npx skills add cranberrii/skills-stack        # my own skills
npx skills add mattpocock/skills              # Matt Pocock's engineering + writing skills
npx skills add obra/superpowers               # Jesse Vincent's process skills
npx skills add safishamsi/graphify            # knowledge graphs
npx skills add juliusbrussee/caveman          # compressed output mode
npx skills add wandb/weave-integration-skills # W&B Weave tracing
npx skills add ai-evals-course/evals-skills   # LLM eval workflows
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

Matt Pocock's skills are also in the official marketplace as `mattpocock-skills` — an auto-updating, read-only bundle. It's Claude Code only, and installing it *alongside* the skills-CLI copies above leaves you with every skill twice, so pick one:

```
/plugin install mattpocock-skills@claude-plugins-official
```

Ponytail installs from its own marketplace:

```
/plugin marketplace add DietrichGebert/ponytail
/plugin install ponytail@ponytail
```

### Diagram Design (Claude Code, Codex, Pi)

`diagram-design` ships as a native package for each agent. Use these instead of `npx skills add`, which installs only the skill and leaves out the export/import/profile/doctor commands.

Claude Code (then turn on auto-update: `/plugin` → **Marketplaces** → **diagram-design** → **Enable auto-update**):

```
/plugin marketplace add cathrynlavery/diagram-design
/plugin install diagram-design@diagram-design
```

Codex (refreshes at startup; `codex plugin marketplace upgrade diagram-design` to fetch now):

```bash
codex plugin marketplace add cathrynlavery/diagram-design
codex plugin add diagram-design@diagram-design
```

Pi (run `/reload` in an open session; Pi doesn't auto-update, so run `pi update --extensions` to pull updates):

```bash
pi install https://github.com/cathrynlavery/diagram-design
```

PNG export needs Playwright once: `pip install playwright && playwright install chromium`.

### Agents without skills support (Devin, etc.)

A skill is just a markdown file. Copy the skill folder's `SKILL.md` content into whatever persistent context the agent supports — Devin's Knowledge/Playbooks, a `AGENTS.md` section, or the agent's custom-instructions field.

## Skills

### My skills

**Source:** `skills/` in this repo. Install with `npx skills add cranberrii/skills-stack`.

| Skill | Description |
|---|---|
| `codebase-catch-up` | Briefing on what changed in the repo since you last looked — what landed, review, what to do next. Tracks a baseline SHA in `.git/catch-up-baseline`, so each run covers only the new delta |
| `explain-diff-html` | Rich, self-contained HTML explainer for a diff, branch, or PR — background, intuition, code walkthrough, and an interactive quiz |

### Matt Pocock

**Source:** [mattpocock/skills](https://github.com/mattpocock/skills) — "Skills for Real Engineers. Straight from my .claude directory."

Upstream groups these into `engineering`, `productivity`, `misc`, and `in-progress`. Run `/setup-matt-pocock-skills` once per repo before using the engineering set.

**Engineering**

| Skill | Description |
|---|---|
| `setup-matt-pocock-skills` | One-time repo setup (issue tracker, triage label vocabulary, doc layout) for the engineering skills below |
| `ask-matt` | Router over this repo — asks which skill or flow fits your situation |
| `tdd` | Test-driven development: red-green-refactor, one vertical slice at a time |
| `diagnosing-bugs` | Disciplined diagnosis loop: reproduce → minimise → hypothesise → instrument → fix → regression-test |
| `to-spec` | Turn the current conversation into a spec on the issue tracker — synthesis, no interview |
| `to-tickets` | Break a plan or spec into tracer-bullet tickets, each declaring its blocking edges |
| `triage` | Move issues and external PRs through a state machine of triage roles into agent-ready briefs |
| `implement` | Implement a piece of work from a spec or set of tickets |
| `wayfinder` | Map work too big for one session as decision tickets, resolved one at a time |
| `code-review` | Review changes since a fixed point along Standards and Spec axes, in parallel sub-agents |
| `improve-codebase-architecture` | Scan for deepening opportunities, present as visual HTML report, grill through picks |
| `codebase-design` | Shared vocabulary for designing deep modules |
| `domain-modeling` | Build and sharpen a project's domain model — CONTEXT.md, ADRs, terminology |
| `grill-with-docs` | Relentless interview to sharpen a plan, writing ADRs and a glossary as it goes |
| `prototype` | Throwaway prototype to answer a design question |
| `research` | Investigate a question against primary sources, capture findings as Markdown in the repo |
| `resolving-merge-conflicts` | Resolve in-progress git merge/rebase conflicts |
| `wizard` | Generate an interactive bash wizard for steps only a human can perform |

**Productivity**

| Skill | Description |
|---|---|
| `grilling` / `grill-me` | Relentless interview to stress-test a plan, decision, or idea |
| `handoff` | Compact the conversation into a handoff document for another agent |
| `teach` | Teach a new skill or concept within the workspace |
| `to-questionnaire` | Turn a decision you can't fully answer into a questionnaire for someone else |
| `wait-what` | Stop — that last message didn't land, re-pitch it |
| `writing-for-agents` | Writing documents for agents: skills, AGENTS.md, CLAUDE.md |

**Misc**

| Skill | Description |
|---|---|
| `git-guardrails-claude-code` | PreToolUse hooks that block dangerous git commands (push, reset --hard, clean, branch -D) |
| `scaffold-exercises` | Scaffold course exercise structures with problems, solutions, explainers |
| `setup-pre-commit` | Husky + lint-staged pre-commit hooks with typecheck and tests |
| `migrate-to-shoehorn` | Replace `as` assertions in tests with `@total-typescript/shoehorn` |

**In progress** (upstream calls these unfinished — install at your own risk)

| Skill | Description |
|---|---|
| `claude-handoff` | Hand the conversation to a fresh background agent that picks up immediately |
| `loop-me` | Grill you about specs for the workflows you want to build |
| `setup-ts-deep-modules` | Wire dependency-cruiser into a TS repo so each package is a deep module |
| `writing-fragments` | Grilling session that mines you for raw writing fragments |
| `writing-shape` | Shape raw material into an article, paragraph by paragraph |
| `writing-beats` | Assemble raw material into a journey of beats, grounding terms as it goes |

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

### Cathryn Lavery

**Source:** [cathrynlavery/diagram-design](https://github.com/cathrynlavery/diagram-design). Install it as a plugin (see [Diagram Design](#diagram-design-claude-code-codex-pi) above).

| Skill / command | Description |
|---|---|
| `diagram-design` | Editorial diagrams as self-contained HTML + SVG: architecture, flowchart, sequence, ER, timeline, swimlane, Sankey, Gantt, Wardley, and dozens more |
| `export-diagram` | Export a diagram HTML file to `.svg` and `.png` next to the source |
| `import-mermaid` / `import-excalidraw` / `import-drawio` | Redraw Mermaid, Excalidraw, or draw.io sources as editorial diagrams |
| `profile` | Save and load per-client brand profiles (selected per project with a `.diagram-design` marker) |
| `doctor` | One-shot environment check for diagram-design readiness |

In Claude Code these are namespaced (`/diagram-design:export-diagram`). In Pi, invoke the skill with `/skill:diagram-design` and the commands as `/export-diagram`, `/profile`, and so on. In Codex, ask for a diagram in plain language.

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

### Evals Skills

**Source:** [ai-evals-course/evals-skills](https://github.com/ai-evals-course/evals-skills)

| Skill | Description |
|---|---|
| `evals-start` | Entry point — routes you to the right eval skill when you don't know where to begin |
| `eval-audit` | Audit an existing eval pipeline: missing error analysis, unvalidated judges, vanity metrics |
| `error-discovery` | Run error analysis on a dataset: sample traces, annotate, organize failure modes |
| `build-review-interface` | Build a custom browser annotation UI for reviewing LLM traces |
| `generate-synthetic-data` | Dimension-based synthetic test inputs for bootstrapping an eval dataset |
| `write-code-eval` | Code evaluators for failure modes with objective rules |
| `write-judge-prompt` | LLM-as-judge prompts for subjective criteria |
| `validate-evaluator` | Calibrate an LLM judge against human labels (TPR/TNR, bias correction) |
| `evaluate-rag` | Evaluate RAG retrieval and generation quality |

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
