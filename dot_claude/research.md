# Research & Documentation Policy

## Core Rule

Never guess, assume, or rely solely on training data for anything that can go stale:
API signatures, config options, CLI flags, package versions, framework behavior.
Always fetch from official sources first.

Thinking "I already know this" is not an exception. Familiarity is not a substitute for fetching.

## Hard Rules — No Exceptions

- Writing ANY config file (tsconfig.json, .eslintrc, vite.config, pyproject.toml, etc.) → fetch docs first
- Setting up ANY new project or toolchain → fetch the official quickstart first
- Installing or configuring ANY package/tool → fetch docs first
- Answering questions about a specific library's API → fetch docs first
- Anything version-specific → fetch docs first, training data is stale by definition

If you are about to write a config value from memory, stop. Fetch first. Always.

## Official Documentation Sources

### Frontend
- React: https://react.dev
- TypeScript: https://www.typescriptlang.org/docs
- Tailwind CSS: https://tailwindcss.com/docs
- Vite: https://vitejs.dev/guide
- Next.js: https://nextjs.org/docs

### Backend
- FastAPI: https://fastapi.tiangolo.com
- Node.js: https://nodejs.org/en/docs
- Express: https://expressjs.com/en/api.html

### Tooling
- ESLint: https://eslint.org/docs/latest
- Prettier: https://prettier.io/docs/en
- Husky: https://typicode.github.io/husky
- lint-staged: https://github.com/lint-staged/lint-staged
- Ruff: https://docs.astral.sh/ruff
- uv: https://docs.astral.sh/uv

### Package Registries
- npm: https://www.npmjs.com/package/<name>
- PyPI: https://pypi.org/project/<name>

## Project Setup Rule

When starting any new project (React, FastAPI, etc.), always:
1. Fetch the current official quickstart/setup guide
2. Use the versions and config patterns from those docs
3. Do not assume config file formats — check the official docs for the tool's current version
