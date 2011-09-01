require "spec_helper"

describe SicossLocationsController do
  describe "routing" do

    it "routes to #index" do
      get("/sicoss_locations").should route_to("sicoss_locations#index")
    end

    it "routes to #new" do
      get("/sicoss_locations/new").should route_to("sicoss_locations#new")
    end

    it "routes to #show" do
      get("/sicoss_locations/1").should route_to("sicoss_locations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sicoss_locations/1/edit").should route_to("sicoss_locations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sicoss_locations").should route_to("sicoss_locations#create")
    end

    it "routes to #update" do
      put("/sicoss_locations/1").should route_to("sicoss_locations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sicoss_locations/1").should route_to("sicoss_locations#destroy", :id => "1")
    end

  end
end
