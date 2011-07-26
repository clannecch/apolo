require 'spec_helper'

describe "associated_document_types/edit.html.haml" do
  before(:each) do
    @asociate_document_type = assign(:asociate_document_type, stub_model(AssociatedDocumentType,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit asociate_document_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => asociate_document_types_path(@asociate_document_type), :method => "post" do
      assert_select "input#asociate_document_type_name", :name => "asociate_document_type[name]"
      assert_select "input#asociate_document_type_company_id", :name => "asociate_document_type[company_id]"
    end
  end
end
