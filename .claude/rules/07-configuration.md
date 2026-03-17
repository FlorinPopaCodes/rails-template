---
description: Configuration management with anyway_config
globs: "config/configs/**/*.rb"
---

# Configuration

## Use anyway_config — Never ENV Directly

```ruby
# config/configs/application_config.rb
class ApplicationConfig < Anyway::Config
  class << self
    delegate_missing_to :instance

    private

    def instance = @instance ||= new
  end
end

# config/configs/gemini_config.rb
class GeminiConfig < ApplicationConfig
  attr_config :api_key
end
```

Usage: `GeminiConfig.api_key` (not `ENV["GEMINI_API_KEY"]`)

Environment variables map automatically: `GEMINI_API_KEY=xxx` -> `GeminiConfig.api_key`

Don't use: Rails credentials, `ENV` directly, `ENV.fetch`.
