require "rails_helper"

RSpec.describe StationsController, type: :routing do
  describe "routing" do

    it "routes to #show" do
      expect(get: "/stations/1").to route_to("stations#show", id: "1")
    end
  end
end
