# Task Tracking Policy

## Core Rule

Whenever something worth doing comes up in conversation — a feature idea, a follow-up task, a tool to build, anything deferred to "later" — always prompt to add it as a Linear issue before moving on.

Do not let ideas get lost in conversation history.

## When to Prompt

- User says "later", "eventually", "we should also...", "note this down"
- A new project or tool is discussed but not being built right now
- A bug or improvement is noticed mid-task but not the current focus
- End of a session where things were discussed but not acted on

## How to Create the Issue

Always ask which team/project to file it under if unclear.

Defaults for every issue — no exceptions:
- Status: **In Review** (never Backlog or Todo)
- Assignee: **me** (arvind choudhary)
- Label: pick the most relevant — Feature, Bug, or Improvement

Issue descriptions must be **crisp and minimal**:
- One line: what it is
- One line: why it exists or what it unblocks
- Stack/approach only if already decided
- No fluff, no repeating context, no lengthy explanations

## Extensive Feature Planning

When implementing an extensive feature (multiple files, multiple services, multi-step flows), **always** create one Linear issue per logical sub-task — not one issue for the whole feature.

Each sub-task issue must be:
- Created with status **In Review** (implementation done, waiting for user to test)
- Tagged with the correct label (Feature / Bug / Improvement)
- Minimal description — what was built and where, nothing more

## Status Lifecycle

```
Todo        → work has not started yet
In Progress → agent is actively implementing
In Review   → agent has finished, waiting for user to confirm
Done        → confirmed working
```

The agent sets **In Review** when finished.
The agent can mark **Done** but MUST ask the user first before doing so.

## Source Tagging

Every issue description must end with a source block so it's traceable back to where the idea came from:

```
---
Source: agent/{last-segment-of-working-directory}
```

Example: if working in `/home/watermelon/MCPs/claude-agent-bus`, add:
```
---
Source: agent/claude-agent-bus
```

This helps trace any issue back to the exact session and project it came from.

## Current Tracked Work

- PRE-5: Build Agent Bus MCP Server (Claude instances talk to each other)
- PRE-6: Build Docs Fetcher MCP Server (smarter documentation fetching)
- PRE-13: Self-Serve Signup — Send OTP endpoint (In Review)
- PRE-14: Self-Serve Signup — Verify OTP endpoint (In Review)
- PRE-15: Self-Serve Signup — Crawl company endpoint (In Review)
- PRE-16: Self-Serve Signup — Create account endpoint (In Review)
- PRE-17: Self-Serve Signup — Multi-step UI page (In Review)
- PRE-18: Self-Serve Signup — Make username optional in Gatekeeper (In Review)
