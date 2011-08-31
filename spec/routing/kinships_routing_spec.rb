require "spec_helper"

describe KinshipsController do
  describe "routing" do

    it "routes to #index" do
      get("/kinships").should route_to("kinships#index")
    end

    it "routes to #new" do
      get("/kinships/new").should route_to("kinships#new")
    end

    it "routes to #show" do
      get("/kinships/1").should route_to("kinships#show", :id => "1")
    end

    it "routes to #edit" do
      get("/kinships/1/edit").should route_to("kinships#edit", :id => "1")
    end

    it "routes to #create" do
      post("/kinships").should route_to("kinships#create")
    end

    it "routes to #update" do
      put("/kinships/1").should route_to("kinships#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/kinships/1").should route_to("kinships#destroy", :id => "1")
    end

  end
end
