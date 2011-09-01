require 'spec_helper'

describe "employer_types/new.html.haml" do
  before(:each) do
    assign(:employer_type, stub_model(EmployerType,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new employer_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => employer_types_path, :method => "post" do
      assert_select "input#employer_type_name", :name => "employer_type[name]"
      assert_select "input#employer_type_company_id", :name => "employer_type[company_id]"
    end
  end
end
