require "spec_helper"

describe SyscossRegimenController do
  describe "routing" do

    it "routes to #index" do
      get("/syscoss_regimen").should route_to("syscoss_regimen#index")
    end

    it "routes to #new" do
      get("/syscoss_regimen/new").should route_to("syscoss_regimen#new")
    end

    it "routes to #show" do
      get("/syscoss_regimen/1").should route_to("syscoss_regimen#show", :id => "1")
    end

    it "routes to #edit" do
      get("/syscoss_regimen/1/edit").should route_to("syscoss_regimen#edit", :id => "1")
    end

    it "routes to #create" do
      post("/syscoss_regimen").should route_to("syscoss_regimen#create")
    end

    it "routes to #update" do
      put("/syscoss_regimen/1").should route_to("syscoss_regimen#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/syscoss_regimen/1").should route_to("syscoss_regimen#destroy", :id => "1")
    end

  end
end
