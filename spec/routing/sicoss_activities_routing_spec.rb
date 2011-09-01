require "spec_helper"

describe SicossActivitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/sicoss_activities").should route_to("sicoss_activities#index")
    end

    it "routes to #new" do
      get("/sicoss_activities/new").should route_to("sicoss_activities#new")
    end

    it "routes to #show" do
      get("/sicoss_activities/1").should route_to("sicoss_activities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sicoss_activities/1/edit").should route_to("sicoss_activities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sicoss_activities").should route_to("sicoss_activities#create")
    end

    it "routes to #update" do
      put("/sicoss_activities/1").should route_to("sicoss_activities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sicoss_activities/1").should route_to("sicoss_activities#destroy", :id => "1")
    end

  end
end
