require "rails_helper"

RSpec.describe FrequenciesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/frequencies").to route_to("frequencies#index")
    end

    it "routes to #show" do
      expect(get: "/frequencies/1").to route_to("frequencies#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/frequencies").to route_to("frequencies#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/frequencies/1").to route_to("frequencies#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/frequencies/1").to route_to("frequencies#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/frequencies/1").to route_to("frequencies#destroy", id: "1")
    end
  end
end
