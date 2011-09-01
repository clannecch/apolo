require "spec_helper"

describe SyscossConditionsController do
  describe "routing" do

    it "routes to #index" do
      get("/syscoss_conditions").should route_to("syscoss_conditions#index")
    end

    it "routes to #new" do
      get("/syscoss_conditions/new").should route_to("syscoss_conditions#new")
    end

    it "routes to #show" do
      get("/syscoss_conditions/1").should route_to("syscoss_conditions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/syscoss_conditions/1/edit").should route_to("syscoss_conditions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/syscoss_conditions").should route_to("syscoss_conditions#create")
    end

    it "routes to #update" do
      put("/syscoss_conditions/1").should route_to("syscoss_conditions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/syscoss_conditions/1").should route_to("syscoss_conditions#destroy", :id => "1")
    end

  end
end
