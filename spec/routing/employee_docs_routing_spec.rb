require "spec_helper"

describe EmployeeDocumentsController do
  describe "routing" do

    it "routes to #index" do
      get("/employee_documents").should route_to("employee_documents#index")
    end

    it "routes to #new" do
      get("/employee_documents/new").should route_to("employee_documents#new")
    end

    it "routes to #show" do
      get("/employee_documents/1").should route_to("employee_documents#show", :id => "1")
    end

    it "routes to #edit" do
      get("/employee_documents/1/edit").should route_to("employee_documents#edit", :id => "1")
    end

    it "routes to #create" do
      post("/employee_documents").should route_to("employee_documents#create")
    end

    it "routes to #update" do
      put("/employee_documents/1").should route_to("employee_documents#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/employee_documents/1").should route_to("employee_documents#destroy", :id => "1")
    end

  end
end
