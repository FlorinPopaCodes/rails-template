---
description: Quick reference for pattern selection and anti-patterns
globs: "**/*.rb"
---

# Quick Reference

## Pattern Selection

| Pattern | Location | When |
|---------|----------|------|
| Model method | `Cloud#ready?` | Simple query or check |
| Namespaced class | `Cloud::CardGenerator` | Complex operation (>15 lines) |
| Scope | `Cloud.generated` | Reusable query |
| Job | `CloudGenerationJob` | Async workflow or steps |
| Form Object | `RegistrationForm` | Multi-model create/update |
| Query Object | `Participant::PendingQuery` | Complex query |
| Controller action | `Participant::CloudsController#create` | HTTP handling only |
| Config class | `GeminiConfig` | Configuration |

## Anti-Patterns

| Anti-Pattern | Why | Alternative |
|---|---|---|
| Service object | Unnecessary abstraction | Namespaced model class |
| Result object | Over-engineered | Return value or raise |
| Concern for logic | Magic, hard to trace | Inheritance or delegation |
| ENV variables | Untyped, scattered | anyway_config |
| String state | Type-unsafe | Enum |
| Denormalized schema | Harder to query/extend | Normalized with FK + constraints |
| Fat models (100+ lines) | Hard to maintain | Extract to namespaced classes |
| Fat controllers (10+ lines) | Hard to test | Thin controller + model method |
| Complex conditionals | Hard to read | Guard clauses |

## Pre-Generation Checklist

- [ ] Named after a business domain concept?
- [ ] Model organized in the right order?
- [ ] States in enums, not string columns?
- [ ] Controller action under 10 lines?
- [ ] Complex logic in namespaced model classes?
- [ ] Database normalized (one concern per table)?
- [ ] Foreign keys and constraints added?
- [ ] Counter caches for has_many?
- [ ] Workflows in jobs with `ActiveJob::Continuable`?
- [ ] Configuration via `anyway_config`, not ENV?
- [ ] Tests in RSpec?
