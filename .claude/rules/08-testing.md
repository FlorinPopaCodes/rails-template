---
description: Testing patterns — RSpec, FactoryBot, what to test
globs: "spec/**/*.rb"
---

# Testing

## RSpec, Not Minitest

```
spec/
  models/          # Model logic
  requests/        # Controller/HTTP responses
  system/          # Full-stack browser tests (excluded by default)
  factories/
  support/
```

## Test Custom Logic, Not Framework Behavior

Skip: ActiveRecord callbacks, basic CRUD, model associations, generated code.
Test: custom validations, business logic methods, controller responses, integration flows.

## FactoryBot for Test Data

```ruby
FactoryBot.define do
  factory :participant do
    full_name { Faker::Name.name }
    email { Faker::Internet.email }

    trait :with_cloud do
      after(:create) { |p| create(:cloud, participant: p) }
    end
  end
end
```

## Request Tests for HTTP Behavior

```ruby
describe "POST /participant/:token/clouds" do
  it "creates a cloud" do
    participant = create(:participant)
    expect { post path, params: valid_params }.to change(Cloud, :count).by(1)
    expect(response).to redirect_to(cloud_path(Cloud.last))
  end
end
```

## System Tests: Critical User Flows Only

Exclude by default, run with `rspec --tag type:system`.
