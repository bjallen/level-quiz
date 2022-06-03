require "rails_helper"

RSpec.describe BehaviorsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/behaviors").to route_to("behaviors#index")
    end

    it "routes to #new" do
      expect(get: "/behaviors/new").to route_to("behaviors#new")
    end

    it "routes to #show" do
      expect(get: "/behaviors/1").to route_to("behaviors#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/behaviors/1/edit").to route_to("behaviors#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/behaviors").to route_to("behaviors#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/behaviors/1").to route_to("behaviors#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/behaviors/1").to route_to("behaviors#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/behaviors/1").to route_to("behaviors#destroy", id: "1")
    end
  end
end
