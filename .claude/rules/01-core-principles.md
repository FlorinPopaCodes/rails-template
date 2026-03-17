---
description: Core Rails code generation principles — simplicity, domain naming, layer responsibility
globs: "**/*.rb"
---

# Core Principles

Generated code should be so simple and clear that reading it feels like reading well-written documentation.

- Follow Rails conventions (not fight the framework)
- Use domain language (Participant, not User; Cloud, not GeneratedImage)
- Keep logic at the right layer (models handle data, controllers handle HTTP, jobs coordinate workflows)
- Be readable without comments
- Normalize data properly (separate concerns into tables, not columns)

## Prohibited Patterns

- No `app/services/` folder — use namespaced model classes instead (`Cloud::CardGenerator`)
- No `app/contexts/` or `app/operations/` folders
- No service objects, use case / operation / interactor gems
- No concerns for business logic — use inheritance
- No Devise, CanCanCan, or ActiveAdmin
- No complex state machine gems — use enums
- No Virtus, Literal, dry-types, reform — use plain models
- No Result objects — return values or raise exceptions
- No passing around hashes — return objects
