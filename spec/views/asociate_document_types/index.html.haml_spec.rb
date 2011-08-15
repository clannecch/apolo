require 'spec_helper'

describe "associated_document_types/indexoo.html.haml" do
  before(:each) do
    assign(:asociate_document_types, [
      stub_model(AssociatedDocumentType,
        :name => "Name",
        :company_id => 1
      ),
      stub_model(AssociatedDocumentType,
        :name => "Name",
        :company_id => 1
      )
    ])
  end

  it "renders a list of associated_document_types" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
