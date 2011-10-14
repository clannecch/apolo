require "spec_helper"

describe ConsortiaController do
  describe "routing" do

    it "routes to #index" do
      get("/consortia").should route_to("consortia#index")
    end

    it "routes to #new" do
      get("/consortia/new").should route_to("consortia#new")
    end

    it "routes to #show" do
      get("/consortia/1").should route_to("consortia#show", :id => "1")
    end

    it "routes to #edit" do
      get("/consortia/1/edit").should route_to("consortia#edit", :id => "1")
    end

    it "routes to #create" do
      post("/consortia").should route_to("consortia#create")
    end

    it "routes to #update" do
      put("/consortia/1").should route_to("consortia#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/consortia/1").should route_to("consortia#destroy", :id => "1")
    end

  end
end
