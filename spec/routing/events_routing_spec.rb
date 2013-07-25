require 'spec_helper'

describe Api::EventsController do
  route_prefix = "/api"
  controller_prefix = "api/"

  describe "routing" do
    it "routes to #index" do
      expect(get: "#{route_prefix}/users/1/events").to route_to("#{controller_prefix}events#index", user_id: "1", format: :json)
    end

    it "routes to #index" do
      expect(get: "#{route_prefix}/events").to route_to("#{controller_prefix}events#index", format: :json)
    end

    it "routes to #show" do
      expect(get: "#{route_prefix}/events/1").to route_to("#{controller_prefix}events#show", id: "1", format: :json)
    end

    it "routes to #create" do
      expect(post: "#{route_prefix}/events").to route_to("#{controller_prefix}events#create", format: :json)
    end

  end
end
