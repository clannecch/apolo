require 'spec_helper'

describe "sicoss_employer_types/edit.html.haml" do
  before(:each) do
    @sicoss_employer_type = assign(:sicoss_employer_type, stub_model(SicossEmployerType,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit sicoss_employer_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sicoss_employer_types_path(@sicoss_employer_type), :method => "post" do
      assert_select "input#sicoss_employer_type_name", :name => "sicoss_employer_type[name]"
      assert_select "input#sicoss_employer_type_company_id", :name => "sicoss_employer_type[company_id]"
    end
  end
end
