require "spec_helper"

RSpec.describe StatusChecker do
  it "has a version number" do
    expect(StatusChecker::VERSION).not_to be nil
  end

  describe "Request" do
    it "creates a new request" do
      request = StatusChecker::Request.new("http://google.com")
      expect(request).to be_a(StatusChecker::Request)
    end
  end
  
end
