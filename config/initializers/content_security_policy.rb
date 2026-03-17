Rails.application.configure do
  config.content_security_policy do |policy|
    policy.default_src :self, :https
    policy.font_src :self, :https, :data
    policy.img_src :self, :https, :data
    policy.object_src :none
    policy.script_src :self, :https
    policy.style_src :self, :https
    policy.connect_src :self, :https

    if Rails.env.development?
      policy.script_src(*policy.script_src, :unsafe_eval, :unsafe_inline, "http://#{ViteRuby.config.host_with_port}")
      policy.style_src(*policy.style_src, :unsafe_inline)
      policy.connect_src(*policy.connect_src, "ws://#{ViteRuby.config.host_with_port}")
    end

    if Rails.env.test?
      policy.script_src(*policy.script_src, :blob)
    end
  end
end
