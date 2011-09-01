require "spec_helper"

describe SiscossRegimenTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/siscoss_regimen_types").should route_to("siscoss_regimen_types#index")
    end

    it "routes to #new" do
      get("/siscoss_regimen_types/new").should route_to("siscoss_regimen_types#new")
    end

    it "routes to #show" do
      get("/siscoss_regimen_types/1").should route_to("siscoss_regimen_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/siscoss_regimen_types/1/edit").should route_to("siscoss_regimen_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/siscoss_regimen_types").should route_to("siscoss_regimen_types#create")
    end

    it "routes to #update" do
      put("/siscoss_regimen_types/1").should route_to("siscoss_regimen_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/siscoss_regimen_types/1").should route_to("siscoss_regimen_types#destroy", :id => "1")
    end

  end
end
