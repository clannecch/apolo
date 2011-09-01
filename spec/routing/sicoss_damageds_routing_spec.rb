require "spec_helper"

describe SicossDamagedsController do
  describe "routing" do

    it "routes to #index" do
      get("/sicoss_damageds").should route_to("sicoss_damageds#index")
    end

    it "routes to #new" do
      get("/sicoss_damageds/new").should route_to("sicoss_damageds#new")
    end

    it "routes to #show" do
      get("/sicoss_damageds/1").should route_to("sicoss_damageds#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sicoss_damageds/1/edit").should route_to("sicoss_damageds#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sicoss_damageds").should route_to("sicoss_damageds#create")
    end

    it "routes to #update" do
      put("/sicoss_damageds/1").should route_to("sicoss_damageds#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sicoss_damageds/1").should route_to("sicoss_damageds#destroy", :id => "1")
    end

  end
end
