# Rails Template

Opinionated Rails 8.1 starter. SQLite everywhere, Inertia.js + React + TypeScript frontend, strict code quality gates.

## Stack

| Layer | Choice |
|-------|--------|
| Runtime | Ruby 3.3 (mise), Rails 8.1, Puma |
| Database | SQLite (all environments) |
| Frontend | Inertia.js + React + TypeScript via Vite (bun) |
| Background jobs | Solid Queue |
| Cache / Cable | Solid Cache, Solid Cable |
| Linting | Standard + standard-rails + standard-rspec |
| Typing | Sorbet + Tapioca + Spoom |
| Testing | RSpec, FactoryBot, Faker, TestProf |
| Observability | Sentry, Lograge (JSON) |
| Configuration | anyway_config (never raw ENV) |
| Ops | maintenance_tasks (web UI at `/maintenance_tasks`) |
| Migrations | strong_migrations |
| Git hooks | prek (gitleaks, standardrb, rspec, sorbet) |
| Deploy | Kamal + Thruster + Docker |

## Prerequisites

- [mise](https://mise.jdx.dev/) (manages Ruby, Bun, prek)

## Setup

```sh
git clone https://github.com/FlorinPopaCodes/rails-template.git
cd rails-template
mise install
bundle install
bun install
bin/rails db:prepare
```

## Development

```sh
bin/dev              # Rails + Vite dev servers (foreman)
bin/rails console    # Rails console
bundle exec rspec    # Tests
bundle exec standardrb          # Lint
bundle exec srb tc              # Type check
bundle exec spoom coverage      # Typing coverage
```

## Key Decisions

- **No service objects** — namespaced model classes instead (`Cloud::CardGenerator`)
- **No concerns for logic** — inheritance or delegation
- **No Devise/CanCanCan** — built-in auth generators + action_policy
- **No dry gems** — plain models, enums for state, raise on errors
- **Frontend is swappable** — Inertia+React is default, designed to swap for htmx or Stimulus

See [TODO.md](TODO.md) for roadmap and deferred work.

## CI

GitHub Actions runs on every PR and push to main:

- **scan_ruby** — Brakeman + bundler-audit
- **scan_js** — bun audit
- **lint** — standardrb
- **test** — RSpec
- **typecheck** — Sorbet

## Project Structure

```
app/
  controllers/       # Thin, HTTP-only (target 5-10 lines/action)
  models/            # Domain logic + namespaced classes for complex ops
  frontend/          # React + TypeScript (Inertia pages)
  jobs/              # Workflow orchestration (ActiveJob::Continuable)
  tasks/maintenance/ # Operational tasks (maintenance_tasks)
config/
  configs/           # anyway_config classes (typed env config)
.claude/
  rules/             # Coding conventions (10 rule files)
```

## AI Agents

This project includes instructions for AI coding agents:

- **`CLAUDE.md`** — project overview, commands, conventions (loaded automatically by Claude Code)
- **`.claude/rules/`** — detailed coding conventions (models, controllers, jobs, database, testing, configuration, forms/queries)

These files define the architecture and anti-patterns. Read them before generating code.

## License

[MIT](LICENSE)
