require 'spec_helper'

describe "syscoss_employer_types/edit.html.haml" do
  before(:each) do
    @syscoss_employer_type = assign(:syscoss_employer_type, stub_model(SyscossEmployerType,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit syscoss_employer_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => syscoss_employer_types_path(@syscoss_employer_type), :method => "post" do
      assert_select "input#syscoss_employer_type_name", :name => "syscoss_employer_type[name]"
      assert_select "input#syscoss_employer_type_company_id", :name => "syscoss_employer_type[company_id]"
    end
  end
end
