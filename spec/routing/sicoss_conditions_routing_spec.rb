require "spec_helper"

describe SicossConditionsController do
  describe "routing" do

    it "routes to #index" do
      get("/sicoss_conditions").should route_to("sicoss_conditions#index")
    end

    it "routes to #new" do
      get("/sicoss_conditions/new").should route_to("sicoss_conditions#new")
    end

    it "routes to #show" do
      get("/sicoss_conditions/1").should route_to("sicoss_conditions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sicoss_conditions/1/edit").should route_to("sicoss_conditions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sicoss_conditions").should route_to("sicoss_conditions#create")
    end

    it "routes to #update" do
      put("/sicoss_conditions/1").should route_to("sicoss_conditions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sicoss_conditions/1").should route_to("sicoss_conditions#destroy", :id => "1")
    end

  end
end
