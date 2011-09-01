require "spec_helper"

describe SyscossRegimenTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/syscoss_regimen_types").should route_to("syscoss_regimen_types#index")
    end

    it "routes to #new" do
      get("/syscoss_regimen_types/new").should route_to("syscoss_regimen_types#new")
    end

    it "routes to #show" do
      get("/syscoss_regimen_types/1").should route_to("syscoss_regimen_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/syscoss_regimen_types/1/edit").should route_to("syscoss_regimen_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/syscoss_regimen_types").should route_to("syscoss_regimen_types#create")
    end

    it "routes to #update" do
      put("/syscoss_regimen_types/1").should route_to("syscoss_regimen_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/syscoss_regimen_types/1").should route_to("syscoss_regimen_types#destroy", :id => "1")
    end

  end
end
