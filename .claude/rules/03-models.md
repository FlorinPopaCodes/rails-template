---
description: Model organization, naming, extraction patterns
globs: "app/models/**/*.rb"
---

# Model Patterns

## Organization Order

Always follow this order in model files:

1. Gems and DSL extensions
2. Associations
3. Enums (for state)
4. Normalization (Rails 8+)
5. Validations
6. Scopes
7. Callbacks
8. Delegated methods
9. Public instance methods
10. Private methods

## Naming: Use Domain Language

Bad: `User`, `GeneratedImage`
Good: `Participant`, `Cloud` — names reflect the business domain

## Enums for State

Always use enums for states. No string columns.

```ruby
enum :state, %w[uploaded analyzing generated failed].index_by(&:itself)
```

## Thin Models — Extract at 100+ Lines

Extract complex logic to namespaced classes:

```ruby
# app/models/cloud/card_generator.rb
class Cloud::CardGenerator
  private attr_reader :cloud, :api_key

  def initialize(cloud, api_key: GeminiConfig.api_key)
    @cloud = cloud
    @api_key = api_key
  end

  def generate
    # Returns simple value or raises
  end
end
```

Extract when: method > 15 lines, calls external APIs, complex calculation, reusable.

## Counter Caches

Every `has_many` should have a counter cache.

## Callbacks: Use Sparingly

OK for: setting defaults (`self.access_token ||= Nanoid.generate`)
Not OK for: complex workflows — use jobs or form objects instead.
