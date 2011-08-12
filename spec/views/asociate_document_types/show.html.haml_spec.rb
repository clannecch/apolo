require 'spec_helper'

describe "associated_document_types/show.html.haml" do
  before(:each) do
    @asociate_document_type = assign(:asociate_document_type, stub_model(AssociatedDocumentType,
      :name => "Name",
      :company_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
