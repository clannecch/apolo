require "spec_helper"

describe AsociateDocumentTypesController do
  describe "routing" do

    it "routes to #index" do
      get("/associated_document_types").should route_to("associated_document_types#index")
    end

    it "routes to #new" do
      get("/associated_document_types/new").should route_to("associated_document_types#new")
    end

    it "routes to #show" do
      get("/associated_document_types/1").should route_to("associated_document_types#show", :id => "1")
    end

    it "routes to #edit" do
      get("/associated_document_types/1/edit").should route_to("associated_document_types#edit", :id => "1")
    end

    it "routes to #create" do
      post("/associated_document_types").should route_to("associated_document_types#create")
    end

    it "routes to #update" do
      put("/associated_document_types/1").should route_to("associated_document_types#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/associated_document_types/1").should route_to("associated_document_types#destroy", :id => "1")
    end

  end
end
