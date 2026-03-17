Sentry.init do |config|
  config.dsn = SentryConfig.dsn
  config.environment = SentryConfig.environment
  config.traces_sample_rate = SentryConfig.traces_sample_rate
  config.profiles_sample_rate = SentryConfig.profiles_sample_rate
  config.send_default_pii = SentryConfig.send_default_pii

  config.traces_sampler = lambda do |sampling_context|
    transaction_context = sampling_context[:transaction_context]
    if transaction_context[:name] == "GET /up"
      0.0
    else
      SentryConfig.traces_sample_rate
    end
  end
end
