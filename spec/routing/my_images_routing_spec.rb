require "spec_helper"

describe MyImagesController do
  describe "routing" do

    it "routes to #index" do
      get("/my_images").should route_to("my_images#index")
    end

    it "routes to #new" do
      get("/my_images/new").should route_to("my_images#new")
    end

    it "routes to #show" do
      get("/my_images/1").should route_to("my_images#show", :id => "1")
    end

    it "routes to #edit" do
      get("/my_images/1/edit").should route_to("my_images#edit", :id => "1")
    end

    it "routes to #create" do
      post("/my_images").should route_to("my_images#create")
    end

    it "routes to #update" do
      put("/my_images/1").should route_to("my_images#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/my_images/1").should route_to("my_images#destroy", :id => "1")
    end

  end
end
