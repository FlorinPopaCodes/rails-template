---
description: Database design — normalization, constraints, migrations
globs: "db/migrate/**/*.rb"
---

# Database Design

## Normalize: One Concern Per Table

Separate concerns into tables, not columns. Easier to query, extend, and analyze.

## Constraints

Always add to migrations:
- `null: false` on required columns
- Foreign keys with `on_delete: :cascade`
- Check constraints for business rules

```ruby
add_foreign_key :clouds, :participants, on_delete: :cascade
add_check_constraint :participants, "cloud_generations_count <= cloud_generations_quota"
```

Database prevents invalid states.

## Enums

Use string enums in the model layer (SQLite doesn't support database-level enums like PostgreSQL).

```ruby
enum :state, %w[uploaded analyzing generated failed].index_by(&:itself)
```

## Indexes

Index on: foreign keys, frequently queried columns, enum state columns, columns in scopes.

```ruby
t.index [:participant_id, :state]
```

## Counter Caches

Add counter cache columns in migrations:

```ruby
add_column :participants, :clouds_count, :integer, default: 0, null: false
```
