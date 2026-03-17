class LogrageConfig < ApplicationConfig
  attr_config enabled: Rails.env.production?
end
