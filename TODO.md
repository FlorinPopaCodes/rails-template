# Rails Template — Gem & Tool Setup

## Decisions
- **UI**: Inertia.js + React + TypeScript (default), designed to be swappable for htmx or Stimulus+ViewComponents
- **Server**: Puma (default, no fiber compat issues)
- **Linting**: Standard (not raw RuboCop) — wraps RuboCop, zero-config
- **Skipped**: dry gems, Sidekiq (SQLite-based alternatives via Solid Queue)

---

## Phase 0: Foundation
- [x] mise + Ruby 3.3
- [x] prek (pre-commit)
- [x] `.claude/rules/` — Rails code generation rules

## Phase 1: Core Rails Setup
- [x] Generate Rails app (`--skip-test --skip-hotwire --skip-jbuilder`)
- [x] rspec-rails + `rails generate rspec:install`
- [x] strong_migrations + `rails generate strong_migrations:install`
- [x] anyway_config + `config/configs/application_config.rb` base class

## Phase 2: Code Quality & Git Hooks
- [x] Standard (standard, standard-rails, standard-rspec) — replaced rubocop-rails-omakase
- [x] RSpec config improvements (.rspec, spec_helper, rails_helper)
- [x] Sorbet + Tapioca + Spoom (tapioca init/gems/dsl, srb tc passes)
- [x] ruby-lsp + ruby-lsp-rails + Zed LSP config
- [x] prek hooks: gitleaks + standardrb (pre-commit), rspec + sorbet (pre-push)
- [x] .gitleaks.toml — allowlist sorbet/rbi/ (false positive in generated RBIs)

## Phase 3: UI — Inertia.js + React (swappable)
- [x] `vite_rails` + `inertia_rails` gems
- [x] React + TypeScript setup (via Vite + bun)
- [x] `@inertiajs/react` — Inertia React adapter
- [x] Inertia entrypoint + sample Home page
- [x] Separate `inertia.html.erb` layout
- [x] `bin/dev` via foreman + Procfile.dev
- [x] Sorbet config: ignore `app/frontend/`

## Phase 4: Observability
- [x] `sentry-ruby` + `sentry-rails` — error tracking (SentryConfig via anyway_config)
- [x] `lograge` — structured JSON request logging (LogrageConfig via anyway_config)
- [x] Fix `ENV.fetch` in production.rb → static `:info` (anyway_config compliance)
- [~] Axiom — infrastructure concern (log drain from STDOUT, not an app gem)
- [~] `health_bit` — skipped (Rails built-in `/up` sufficient for SQLite-only template)

## Phase 4b: Wide Events (deferred)
- [ ] Wide events pattern — structured observability via `ActiveSupport::Notifications`
- References: https://loggingsucks.com/, https://boristane.com/blog/observability-wide-events-101/

## Phase 5: DevEX & Operations
- [ ] `maintenance_tasks` — operational rake tasks with UI
- [ ] Litestream — SQLite backup/replication (sidecar, not a gem)

## Phase 6: Admin
- [ ] Document Avo as optional add-on (not included in template)

## Phase 7: Resilience (defer until needed)
- [ ] Semian — circuit breaker
- [ ] Temporal.io — workflow orchestration (heavy dependency, needs its own server)

## Phase 8: Architecture (defer)
- [ ] Packwerk — modular monolith boundaries (add when codebase grows)
