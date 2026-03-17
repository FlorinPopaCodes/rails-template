# Project Overview
Rails template project — curated starter with opinionated gem choices.

# Tech Stack
- Ruby 3.3 (via mise), Rails 8.1, SQLite, Puma
- Inertia.js + React + TypeScript (planned)
- RSpec, FactoryBot (planned)
- Standard (linting, planned)
- Sorbet + Tapioca (typing, planned)
- anyway_config for configuration

# Commands
- `mise exec -- bin/rails <cmd>` — run Rails commands
- `mise exec -- bundle exec rspec` — run tests
- `mise exec -- bin/rails console` — Rails console

# Conventions
- See `.claude/rules/` for detailed conventions
- No service objects, no concerns for logic, no dry gems
- Domain-named models, thin controllers, enums for state
- anyway_config for all configuration (never ENV directly)

# Architecture
- Standard Rails MVC + namespaced model classes for complex logic
- Solid Queue for background jobs
- SQLite for all storage (cache, queue, cable)

# Testing
- RSpec (not Minitest)
- Request specs for HTTP, model specs for logic
- System tests excluded by default
