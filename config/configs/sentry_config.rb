class SentryConfig < ApplicationConfig
  attr_config :dsn,
    environment: Rails.env,
    traces_sample_rate: 0.1,
    profiles_sample_rate: 0.1,
    send_default_pii: false
end
