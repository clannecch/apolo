require 'spec_helper'

describe "siscoss_employer_types/edit.html.haml" do
  before(:each) do
    @siscoss_employer_type = assign(:siscoss_employer_type, stub_model(SiscossEmployerType,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit siscoss_employer_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => siscoss_employer_types_path(@siscoss_employer_type), :method => "post" do
      assert_select "input#siscoss_employer_type_name", :name => "siscoss_employer_type[name]"
      assert_select "input#siscoss_employer_type_company_id", :name => "siscoss_employer_type[company_id]"
    end
  end
end
