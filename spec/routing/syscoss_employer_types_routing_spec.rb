require "spec_helper"

describe SyscossEmployerTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/syscoss_employer_types").should route_to("syscoss_employer_types#index")
    end

    it "routes to #new" do
      get("/syscoss_employer_types/new").should route_to("syscoss_employer_types#new")
    end

    it "routes to #show" do
      get("/syscoss_employer_types/1").should route_to("syscoss_employer_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/syscoss_employer_types/1/edit").should route_to("syscoss_employer_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/syscoss_employer_types").should route_to("syscoss_employer_types#create")
    end

    it "routes to #update" do
      put("/syscoss_employer_types/1").should route_to("syscoss_employer_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/syscoss_employer_types/1").should route_to("syscoss_employer_types#destroy", :id => "1")
    end

  end
end
