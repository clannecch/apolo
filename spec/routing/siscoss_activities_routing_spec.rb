require "spec_helper"

describe SiscossActivitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/siscoss_activities").should route_to("siscoss_activities#index")
    end

    it "routes to #new" do
      get("/siscoss_activities/new").should route_to("siscoss_activities#new")
    end

    it "routes to #show" do
      get("/siscoss_activities/1").should route_to("siscoss_activities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/siscoss_activities/1/edit").should route_to("siscoss_activities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/siscoss_activities").should route_to("siscoss_activities#create")
    end

    it "routes to #update" do
      put("/siscoss_activities/1").should route_to("siscoss_activities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/siscoss_activities/1").should route_to("siscoss_activities#destroy", :id => "1")
    end

  end
end
