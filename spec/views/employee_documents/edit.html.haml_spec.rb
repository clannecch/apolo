require 'spec_helper'

describe "employee_documents/edit.html.haml" do
  before(:each) do
    @employee_doc = assign(:employee_doc, stub_model(EmployeeDocument,
      :id_employee => 1,
      :name => "MyString",
      :doc_file_name => "MyString",
      :doc_content_type => "MyString",
      :doc_file => "",
      :doc_small_file => "",
      :doc_thumb_file => "",
      :doc_file_size => 1
    ))
  end

  it "renders the edit employee_doc form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => employee_docs_path(@employee_doc), :method => "post" do
      assert_select "input#employee_doc_id_employee", :name => "employee_doc[id_employee]"
      assert_select "input#employee_doc_name", :name => "employee_doc[name]"
      assert_select "input#employee_doc_doc_file_name", :name => "employee_doc[doc_file_name]"
      assert_select "input#employee_doc_doc_content_type", :name => "employee_doc[doc_content_type]"
      assert_select "input#employee_doc_doc_file", :name => "employee_doc[doc_file]"
      assert_select "input#employee_doc_doc_small_file", :name => "employee_doc[doc_small_file]"
      assert_select "input#employee_doc_doc_thumb_file", :name => "employee_doc[doc_thumb_file]"
      assert_select "input#employee_doc_doc_file_size", :name => "employee_doc[doc_file_size]"
    end
  end
end
