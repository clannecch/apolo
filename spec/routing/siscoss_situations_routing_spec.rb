require "spec_helper"

describe SiscossSituationsController do
  describe "routing" do

    it "routes to #index" do
      get("/siscoss_situations").should route_to("siscoss_situations#index")
    end

    it "routes to #new" do
      get("/siscoss_situations/new").should route_to("siscoss_situations#new")
    end

    it "routes to #show" do
      get("/siscoss_situations/1").should route_to("siscoss_situations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/siscoss_situations/1/edit").should route_to("siscoss_situations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/siscoss_situations").should route_to("siscoss_situations#create")
    end

    it "routes to #update" do
      put("/siscoss_situations/1").should route_to("siscoss_situations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/siscoss_situations/1").should route_to("siscoss_situations#destroy", :id => "1")
    end

  end
end
