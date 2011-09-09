require "spec_helper"

describe SicossFormatEmployersController do
  describe "routing" do

    it "routes to #index" do
      get("/sicoss_format_employers").should route_to("sicoss_format_employers#index")
    end

    it "routes to #new" do
      get("/sicoss_format_employers/new").should route_to("sicoss_format_employers#new")
    end

    it "routes to #show" do
      get("/sicoss_format_employers/1").should route_to("sicoss_format_employers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/sicoss_format_employers/1/edit").should route_to("sicoss_format_employers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/sicoss_format_employers").should route_to("sicoss_format_employers#create")
    end

    it "routes to #update" do
      put("/sicoss_format_employers/1").should route_to("sicoss_format_employers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/sicoss_format_employers/1").should route_to("sicoss_format_employers#destroy", :id => "1")
    end

  end
end
