require "spec_helper"

describe SyscossDamagedsController do
  describe "routing" do

    it "routes to #index" do
      get("/syscoss_damageds").should route_to("syscoss_damageds#index")
    end

    it "routes to #new" do
      get("/syscoss_damageds/new").should route_to("syscoss_damageds#new")
    end

    it "routes to #show" do
      get("/syscoss_damageds/1").should route_to("syscoss_damageds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/syscoss_damageds/1/edit").should route_to("syscoss_damageds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/syscoss_damageds").should route_to("syscoss_damageds#create")
    end

    it "routes to #update" do
      put("/syscoss_damageds/1").should route_to("syscoss_damageds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/syscoss_damageds/1").should route_to("syscoss_damageds#destroy", :id => "1")
    end

  end
end
