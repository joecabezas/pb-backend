require "rails_helper"

RSpec.describe HposController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/hpos").to route_to("hpos#index")
    end

    it "routes to #show" do
      expect(get: "/hpos/1").to route_to("hpos#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/hpos").to route_to("hpos#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/hpos/1").to route_to("hpos#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/hpos/1").to route_to("hpos#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/hpos/1").to route_to("hpos#destroy", id: "1")
    end
  end
end
