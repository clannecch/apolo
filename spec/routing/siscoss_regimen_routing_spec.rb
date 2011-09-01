require "spec_helper"

describe SiscossRegimenController do
  describe "routing" do

    it "routes to #index" do
      get("/siscoss_regimen").should route_to("siscoss_regimen#index")
    end

    it "routes to #new" do
      get("/siscoss_regimen/new").should route_to("siscoss_regimen#new")
    end

    it "routes to #show" do
      get("/siscoss_regimen/1").should route_to("siscoss_regimen#show", :id => "1")
    end

    it "routes to #edit" do
      get("/siscoss_regimen/1/edit").should route_to("siscoss_regimen#edit", :id => "1")
    end

    it "routes to #create" do
      post("/siscoss_regimen").should route_to("siscoss_regimen#create")
    end

    it "routes to #update" do
      put("/siscoss_regimen/1").should route_to("siscoss_regimen#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/siscoss_regimen/1").should route_to("siscoss_regimen#destroy", :id => "1")
    end

  end
end
