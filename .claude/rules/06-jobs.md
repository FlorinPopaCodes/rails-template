---
description: Job patterns — orchestration, error handling, multi-step workflows
globs: "app/jobs/**/*.rb"
---

# Job Patterns

## Jobs Orchestrate, Models Execute

Jobs coordinate workflow steps. Model classes handle complex logic.

```ruby
class CloudGenerationJob < ApplicationJob
  include ActiveJob::Continuable

  def perform(cloud)
    step :moderate, isolated: true
    step :generate, isolated: true unless cloud.failed?
  end
end
```

## Error Handling

```ruby
def moderate(_step)
  cloud.update!(state: :analyzing)
  # work...
  cloud.update!(state: :analyzed)
rescue => err
  Rails.error.report(err, handled: true)
  cloud.update!(state: :failed, failure_reason: err.message)
end
```

Always: catch errors, report to error tracking, update model state, don't re-raise unless entire job should fail.

## Use ActiveJob::Continuable for Multi-Step Workflows

- `step :method_name, isolated: true` — errors caught, job continues
- Update model state after each step
- Conditional steps based on model state
