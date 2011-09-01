require "spec_helper"

describe SyscossReductionZonesController do
  describe "routing" do

    it "routes to #index" do
      get("/syscoss_reduction_zones").should route_to("syscoss_reduction_zones#index")
    end

    it "routes to #new" do
      get("/syscoss_reduction_zones/new").should route_to("syscoss_reduction_zones#new")
    end

    it "routes to #show" do
      get("/syscoss_reduction_zones/1").should route_to("syscoss_reduction_zones#show", :id => "1")
    end

    it "routes to #edit" do
      get("/syscoss_reduction_zones/1/edit").should route_to("syscoss_reduction_zones#edit", :id => "1")
    end

    it "routes to #create" do
      post("/syscoss_reduction_zones").should route_to("syscoss_reduction_zones#create")
    end

    it "routes to #update" do
      put("/syscoss_reduction_zones/1").should route_to("syscoss_reduction_zones#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/syscoss_reduction_zones/1").should route_to("syscoss_reduction_zones#destroy", :id => "1")
    end

  end
end
