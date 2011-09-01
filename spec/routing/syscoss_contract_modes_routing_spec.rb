require "spec_helper"

describe SyscossContractModesController do
  describe "routing" do

    it "routes to #index" do
      get("/syscoss_contract_modes").should route_to("syscoss_contract_modes#index")
    end

    it "routes to #new" do
      get("/syscoss_contract_modes/new").should route_to("syscoss_contract_modes#new")
    end

    it "routes to #show" do
      get("/syscoss_contract_modes/1").should route_to("syscoss_contract_modes#show", :id => "1")
    end

    it "routes to #edit" do
      get("/syscoss_contract_modes/1/edit").should route_to("syscoss_contract_modes#edit", :id => "1")
    end

    it "routes to #create" do
      post("/syscoss_contract_modes").should route_to("syscoss_contract_modes#create")
    end

    it "routes to #update" do
      put("/syscoss_contract_modes/1").should route_to("syscoss_contract_modes#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/syscoss_contract_modes/1").should route_to("syscoss_contract_modes#destroy", :id => "1")
    end

  end
end
