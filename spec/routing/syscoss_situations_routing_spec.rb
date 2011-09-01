require "spec_helper"

describe SyscossSituationsController do
  describe "routing" do

    it "routes to #index" do
      get("/syscoss_situations").should route_to("syscoss_situations#index")
    end

    it "routes to #new" do
      get("/syscoss_situations/new").should route_to("syscoss_situations#new")
    end

    it "routes to #show" do
      get("/syscoss_situations/1").should route_to("syscoss_situations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/syscoss_situations/1/edit").should route_to("syscoss_situations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/syscoss_situations").should route_to("syscoss_situations#create")
    end

    it "routes to #update" do
      put("/syscoss_situations/1").should route_to("syscoss_situations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/syscoss_situations/1").should route_to("syscoss_situations#destroy", :id => "1")
    end

  end
end
