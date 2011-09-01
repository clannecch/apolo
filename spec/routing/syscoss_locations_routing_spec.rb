require "spec_helper"

describe SyscossLocationsController do
  describe "routing" do

    it "routes to #index" do
      get("/syscoss_locations").should route_to("syscoss_locations#index")
    end

    it "routes to #new" do
      get("/syscoss_locations/new").should route_to("syscoss_locations#new")
    end

    it "routes to #show" do
      get("/syscoss_locations/1").should route_to("syscoss_locations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/syscoss_locations/1/edit").should route_to("syscoss_locations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/syscoss_locations").should route_to("syscoss_locations#create")
    end

    it "routes to #update" do
      put("/syscoss_locations/1").should route_to("syscoss_locations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/syscoss_locations/1").should route_to("syscoss_locations#destroy", :id => "1")
    end

  end
end
