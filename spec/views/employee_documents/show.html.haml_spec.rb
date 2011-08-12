require 'spec_helper'

describe "employee_documents/show.html.haml" do
  before(:each) do
    @employee_doc = assign(:employee_doc, stub_model(EmployeeDocument,
      :id_employee => 1,
      :name => "Name",
      :doc_file_name => "Doc File Name",
      :doc_content_type => "Doc Content Type",
      :doc_file => "",
      :doc_small_file => "",
      :doc_thumb_file => "",
      :doc_file_size => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Doc File Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Doc Content Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
