require "spec_helper"

describe NumeradorsController do
  describe "routing" do

    it "routes to #index" do
      get("/numeradors").should route_to("numeradors#index")
    end

    it "routes to #new" do
      get("/numeradors/new").should route_to("numeradors#new")
    end

    it "routes to #show" do
      get("/numeradors/1").should route_to("numeradors#show", :id => "1")
    end

    it "routes to #edit" do
      get("/numeradors/1/edit").should route_to("numeradors#edit", :id => "1")
    end

    it "routes to #create" do
      post("/numeradors").should route_to("numeradors#create")
    end

    it "routes to #update" do
      put("/numeradors/1").should route_to("numeradors#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/numeradors/1").should route_to("numeradors#destroy", :id => "1")
    end

  end
end
