---
description: Form objects for multi-model operations, query objects for complex queries
globs: "app/forms/**/*.rb,app/models/**/*_query.rb"
---

# Form Objects

Use when: creating/updating multiple records, complex cross-model validations, transaction boundaries.

```ruby
class ParticipantRegistrationForm < ApplicationForm
  attribute :full_name, :string
  attribute :email, :string

  validates :full_name, :email, presence: true

  private

  def submit!
    participant = Participant.create!(full_name:, email:)
    participant.invitations.create!
  end
end
```

# Query Objects

Use when: query has multiple conditions, is reused, or is easier to test in isolation.

```ruby
# app/models/participant/pending_query.rb
class Participant::PendingQuery < ApplicationQuery
  def call
    relation.without_picked_cloud.where(blocked: false).order(created_at: :desc)
  end
end

# Usage: Participant::PendingQuery.call
```
