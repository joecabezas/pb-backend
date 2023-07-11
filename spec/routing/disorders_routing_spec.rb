require "rails_helper"

RSpec.describe DisordersController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/disorders").to route_to("disorders#index")
    end

    it "routes to #show" do
      expect(get: "/disorders/1").to route_to("disorders#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "/disorders").to route_to("disorders#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/disorders/1").to route_to("disorders#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/disorders/1").to route_to("disorders#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/disorders/1").to route_to("disorders#destroy", id: "1")
    end
  end
end
