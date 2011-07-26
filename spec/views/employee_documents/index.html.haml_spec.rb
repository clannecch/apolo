require 'spec_helper'

describe "employee_documents/index.html.haml" do
  before(:each) do
    assign(:employee_docs, [
      stub_model(EmployeeDocument,
        :id_employee => 1,
        :name => "Name",
        :doc_file_name => "Doc File Name",
        :doc_content_type => "Doc Content Type",
        :doc_file => "",
        :doc_small_file => "",
        :doc_thumb_file => "",
        :doc_file_size => 1
      ),
      stub_model(EmployeeDocument,
        :id_employee => 1,
        :name => "Name",
        :doc_file_name => "Doc File Name",
        :doc_content_type => "Doc Content Type",
        :doc_file => "",
        :doc_small_file => "",
        :doc_thumb_file => "",
        :doc_file_size => 1
      )
    ])
  end

  it "renders a list of employee_documents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Doc File Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Doc Content Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
