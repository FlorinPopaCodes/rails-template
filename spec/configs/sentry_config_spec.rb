require "rails_helper"

RSpec.describe SentryConfig do
  it "has default traces_sample_rate" do
    expect(described_class.traces_sample_rate).to eq(0.1)
  end

  it "has default send_default_pii" do
    expect(described_class.send_default_pii).to be(false)
  end
end
