require "spec_helper"

describe SiscossLocationsController do
  describe "routing" do

    it "routes to #index" do
      get("/siscoss_locations").should route_to("siscoss_locations#index")
    end

    it "routes to #new" do
      get("/siscoss_locations/new").should route_to("siscoss_locations#new")
    end

    it "routes to #show" do
      get("/siscoss_locations/1").should route_to("siscoss_locations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/siscoss_locations/1/edit").should route_to("siscoss_locations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/siscoss_locations").should route_to("siscoss_locations#create")
    end

    it "routes to #update" do
      put("/siscoss_locations/1").should route_to("siscoss_locations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/siscoss_locations/1").should route_to("siscoss_locations#destroy", :id => "1")
    end

  end
end
