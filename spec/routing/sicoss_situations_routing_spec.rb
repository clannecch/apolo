require "spec_helper"

describe SicossSituationsController do
  describe "routing" do

    it "routes to #index" do
      get("/sicoss_situations").should route_to("sicoss_situations#index")
    end

    it "routes to #new" do
      get("/sicoss_situations/new").should route_to("sicoss_situations#new")
    end

    it "routes to #show" do
      get("/sicoss_situations/1").should route_to("sicoss_situations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sicoss_situations/1/edit").should route_to("sicoss_situations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sicoss_situations").should route_to("sicoss_situations#create")
    end

    it "routes to #update" do
      put("/sicoss_situations/1").should route_to("sicoss_situations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sicoss_situations/1").should route_to("sicoss_situations#destroy", :id => "1")
    end

  end
end
