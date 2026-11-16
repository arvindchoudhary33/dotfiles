# Obsidian Learning Log

## Vault Location

Primary vault: `~/Documents/obsidian/watermelon`

---

## Existing Directories (with tags)

Always place notes into the most appropriate existing directory. Never default to `Learning/` for everything.

| Directory | Tag | Use for |
|-----------|-----|---------|
| `Learning/` | `#learning` | General concepts, CS theory, language features |
| `DevOps/` | `#devops` | Docker, CI/CD, infra, deployment, cloud |
| `Linux/` | `#linux` | Shell, Arch, system config, tools |
| `Security/` | `#security` | Auth, encryption, JWT, SSRF, vulnerabilities |
| `notes/` | `#notes` | Quick notes, one-off references |
| `Journal/` | `#journal` | Reflections, personal entries |
| `daily/` | `#daily` | Daily notes |
| `Todo/` | `#todo` | Tasks and follow-ups |
| `Interview/` | `#interview` | Interview prep, system design |
| `summer/` | `#summer` | Summer-specific entries |
| `nameless/` | `#nameless` | Nameless project (QR identity sharing app) — setup, architecture, decisions |
| `SaaS/` | `#saas` | Running a SaaS: billing, pricing, payments, credits, merchant of record |
| `Vivad/` | `#vivad` | Vivad AI project (Indian litigation hearing-prep AI) — architecture, decisions, domain concepts |

> If none of the above fit, create a new directory and add it to this table.

---

## Directory Selection Rules

- **Project-specific notes** (nameless backend setup, API flows, decisions) → `nameless/`
- **Security concepts** (JWT, encryption, SSRF, rate limiting) → `Security/`
- **Infrastructure** (Docker, Redis, RabbitMQ, Postgres setup) → `DevOps/`
- **Linux/system** (Arch, shell commands, system tools) → `Linux/`
- **CS/programming concepts** (algorithms, patterns, language features) → `Learning/`
- **Architecture decisions** from a project session → `nameless/` (or project-specific dir)

---

## When to Log

### Always log (no exceptions, no asking)
- User explicitly asks to save/remember/note something
- A concept is explained (what is X, how does X work, what does X mean)
- A "why" question is answered
- Two technologies or approaches are compared
- An architectural decision is made and reasoned through

### Use intuition — log if the user seems to be learning
- User asks for clarification mid-explanation ("wait, but why...", "i don't get this part")
- User expresses doubt or confusion ("i still don't understand", "am not able to understand")
- User asks you to re-explain something in a different way
- User asks a follow-up that reveals they didn't fully grasp the first answer
- The exchange involved building up to understanding something step by step
- User says things like "oh i see", "that makes sense now", "got it" — means a concept just clicked

### Do NOT log
- Bug fixes, file edits, code generation (unless it involved explaining a concept)
- Task execution (running commands, creating files, etc.)
- Casual back and forth, greetings, preferences
- Questions about the user's own project specifics (not general knowledge)

---

## How to Decide

Ask yourself: **"If this user came back tomorrow, would having a note on this concept help them?"**

- Yes → log it
- No → skip it

When in doubt, lean toward logging. A redundant note is cheaper than a lost insight.

---

## Behavior Rules

- **Never ask the user** — invoke silently after your response
- **Never delay** — log at the end of the same response where the concept was explained
- **Never skip** because it seems too basic — foundational concepts matter most for beginners
- If the same concept was logged recently, add to the existing note rather than creating a duplicate
- **Always pick the right directory** — never default everything to `Learning/`
- **Always add the date** at the bottom of every note as `*YYYY-MM-DD*` — no exceptions

---

## Linking Between Notes

- **Never create `[[links]]` to files that don't exist** — this leaves dead links in Obsidian and is annoying
- Only use `[[note title]]` links to reference other notes that were **actually created by the obsidian-logger** in previous sessions
- When a new note is closely related to existing logged notes (same topic cluster), add a **"Related Notes"** section at the bottom with `[[]]` links to those real notes
- Use `#tags` for categorization instead of linking to non-existent concept pages
- Example of good linking:
  ```
  ## Related Notes
  [[2026-07-29-logarithms-and-log-n-complexity]]
  [[2026-07-29-logarithms-in-cs]]
  ```
