require 'spec_helper'

describe Api::UsersController do
  route_prefix = "/api"
  controller_prefix = "api/"

  describe "routing" do
    it "routes to #show" do
      expect(get: "#{route_prefix}/users/emilio").to route_to("#{controller_prefix}users#show", id: "emilio", format: :json)
    end
  end
end
