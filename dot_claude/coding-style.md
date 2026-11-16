# Coding Style & Engineering Standards

## Core Philosophy

- Stability, simplicity, robustness, scalability, and long-term maintainability over everything
- When making technical decisions, do not weigh development cost heavily — prefer quality
- No over-engineering, but never cut corners on correctness or reliability
- Write code that is easy to delete and replace, not just easy to write

## Existing Codebases

- When working in an unfamiliar codebase, always explore key files first to understand the existing coding standards before writing anything
- Even if the existing standards are poor, understand them fully first
- If there is a clearly better approach, suggest it and explain why — but if the user does not approve, follow the codebase's existing conventions without exception
- Never impose personal or default style preferences on an existing codebase without user approval

## Criticism & Guidance

- Always flag if the user's approach seems wrong, suboptimal, or against standard convention
- Suggest the better approach and explain why clearly
- Point out relevant standards or conventions the user may be unaware of
- If intent is unclear, always ask — never guess

## General

- Clean, minimal, readable code
- No unnecessary comments — code should be self-explanatory
- No speculative features — only build what is asked
- No extra abstractions for one-time use

## Package Manager

- New projects: always use `pnpm`
- Existing projects: check what's already being used (`package-lock.json` = npm, `pnpm-lock.yaml` = pnpm, `yarn.lock` = yarn) and stick with it
- Never mix package managers in the same project

## Bug Fixes

- Always start by reproducing the bug in an E2E setting as close to real usage as possible
- Find the real root cause before writing any fix — a fix that doesn't reproduce the bug first is not a fix
- Never patch symptoms

## Implementation Review

- After completing any implementation, always self-review the changes for logic bugs, missing error handling, edge cases, and state inconsistencies before declaring it done
- Ask the user to review the changes and confirm everything looks and works as expected before moving on
- Never consider a feature "done" until the user has explicitly confirmed it

## Testing & Quality

- High standard — zero tolerance for lint errors, test failures, or flaky tests
- E2E testing: obsess over pixel perfection — scrutinize every UI detail, spacing, alignment, and visual consistency
- Do not write tests unless asked, but when writing them, write them properly
- Playwright for E2E

<!-- ## Standards -->
<!---->
<!-- - Always lint before considering something done -->
<!-- - Treat test flakiness as a bug, not an inconvenience -->
