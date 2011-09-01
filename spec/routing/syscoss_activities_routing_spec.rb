require "spec_helper"

describe SyscossActivitiesController do
  describe "routing" do

    it "routes to #index" do
      get("/syscoss_activities").should route_to("syscoss_activities#index")
    end

    it "routes to #new" do
      get("/syscoss_activities/new").should route_to("syscoss_activities#new")
    end

    it "routes to #show" do
      get("/syscoss_activities/1").should route_to("syscoss_activities#show", :id => "1")
    end

    it "routes to #edit" do
      get("/syscoss_activities/1/edit").should route_to("syscoss_activities#edit", :id => "1")
    end

    it "routes to #create" do
      post("/syscoss_activities").should route_to("syscoss_activities#create")
    end

    it "routes to #update" do
      put("/syscoss_activities/1").should route_to("syscoss_activities#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/syscoss_activities/1").should route_to("syscoss_activities#destroy", :id => "1")
    end

  end
end
