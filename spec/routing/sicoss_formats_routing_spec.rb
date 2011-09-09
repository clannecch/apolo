require "spec_helper"

describe SicossFormatsController do
  describe "routing" do

    it "routes to #index" do
      get("/sicoss_formats").should route_to("sicoss_formats#index")
    end

    it "routes to #new" do
      get("/sicoss_formats/new").should route_to("sicoss_formats#new")
    end

    it "routes to #show" do
      get("/sicoss_formats/1").should route_to("sicoss_formats#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sicoss_formats/1/edit").should route_to("sicoss_formats#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sicoss_formats").should route_to("sicoss_formats#create")
    end

    it "routes to #update" do
      put("/sicoss_formats/1").should route_to("sicoss_formats#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sicoss_formats/1").should route_to("sicoss_formats#destroy", :id => "1")
    end

  end
end
