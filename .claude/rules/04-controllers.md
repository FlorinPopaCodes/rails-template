---
description: Controller patterns — thin actions, guard clauses, namespacing
globs: "app/controllers/**/*.rb"
---

# Controller Patterns

## Target: 5-10 Lines Per Action

Controllers handle HTTP only. No business logic.

Action structure:
1. Guard clauses (early returns)
2. Simple model operations (create, update)
3. Job enqueueing
4. Redirect/render

## Guard Clauses Over Nested Conditionals

```ruby
def create
  return head 401 unless @participant.premium?
  return head 422 unless params[:valid]

  cloud = @participant.clouds.create!(params.permit(:name))
  redirect_to cloud
end
```

## Namespace Controllers for Authentication/Scoping

```ruby
class Participant::ApplicationController < ::ApplicationController
  before_action :set_participant

  private

  def set_participant
    @participant = ::Participant.find_by!(access_token: params[:access_token])
  end
end

class Participant::CloudsController < Participant::ApplicationController
  # @participant is automatically set
end
```

Inheritance is clearer than concerns.
