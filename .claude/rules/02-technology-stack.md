---
description: Approved technology stack and gems — check before adding dependencies
globs: "**/Gemfile"
---

# Technology Stack

Only use approved gems. If you want to add something not listed, ask first.

## Core
- `rails` (latest stable), `puma`, SQLite + Litestream

## Frontend
- `inertia_rails` + React + TypeScript (via Vite)
- UI paradigm is designed to be swappable — keep server-side rendering concerns isolated

## Jobs & Background Work
- `solid_queue` (default)

## Authentication & Authorization
- Built-in authentication (Rails generator)
- `omniauth` (for OAuth)
- `action_policy` (for complex authorization)

## Configuration
- `anyway_config` (type-safe configuration from environment)
- Don't use: Rails credentials, ENV variables directly

## Testing
- `rspec-rails` (not minitest)
- `factory_bot_rails`, `faker`, `test_prof`

## Code Quality
- `standard` + `standard-rails` + `standard-rspec` (not raw rubocop)
- `sorbet` + `tapioca` + `spoom` (gradual typing)

## Database
- SQLite (via `sqlite3` gem)
- `strong_migrations` (safe migrations)

## Observability
- `sentry-rails`, `lograge`, `health_bit`

## DevEX
- `maintenance_tasks`, `ruby-lsp`

## HTTP & API
- `httparty` (clean HTTP requests)
- Don't use: Faraday, RestClient
