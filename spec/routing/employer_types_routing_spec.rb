require "spec_helper"

describe EmployerTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/employer_types").should route_to("employer_types#index")
    end

    it "routes to #new" do
      get("/employer_types/new").should route_to("employer_types#new")
    end

    it "routes to #show" do
      get("/employer_types/1").should route_to("employer_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/employer_types/1/edit").should route_to("employer_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/employer_types").should route_to("employer_types#create")
    end

    it "routes to #update" do
      put("/employer_types/1").should route_to("employer_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/employer_types/1").should route_to("employer_types#destroy", :id => "1")
    end

  end
end
