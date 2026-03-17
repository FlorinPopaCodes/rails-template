Rails.application.configure do
  config.lograge.enabled = LogrageConfig.enabled
  config.lograge.formatter = Lograge::Formatters::Json.new

  config.lograge.custom_options = lambda do |event|
    {
      request_id: event.payload[:request_id],
      host: event.payload[:host],
      remote_ip: event.payload[:remote_ip]
    }.compact
  end

  config.lograge.ignore_actions = ["Rails::HealthController#show"]
end
