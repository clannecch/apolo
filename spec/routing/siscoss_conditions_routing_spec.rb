require "spec_helper"

describe SiscossConditionsController do
  describe "routing" do

    it "routes to #index" do
      get("/siscoss_conditions").should route_to("siscoss_conditions#index")
    end

    it "routes to #new" do
      get("/siscoss_conditions/new").should route_to("siscoss_conditions#new")
    end

    it "routes to #show" do
      get("/siscoss_conditions/1").should route_to("siscoss_conditions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/siscoss_conditions/1/edit").should route_to("siscoss_conditions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/siscoss_conditions").should route_to("siscoss_conditions#create")
    end

    it "routes to #update" do
      put("/siscoss_conditions/1").should route_to("siscoss_conditions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/siscoss_conditions/1").should route_to("siscoss_conditions#destroy", :id => "1")
    end

  end
end
