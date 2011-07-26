require 'spec_helper'

describe "associated_document_types/new.html.haml" do
  before(:each) do
    assign(:asociate_document_type, stub_model(AssociatedDocumentType,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new asociate_document_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => asociate_document_types_path, :method => "post" do
      assert_select "input#asociate_document_type_name", :name => "asociate_document_type[name]"
      assert_select "input#asociate_document_type_company_id", :name => "asociate_document_type[company_id]"
    end
  end
end
