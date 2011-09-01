require 'spec_helper'

describe "sicoss_conditions/edit.html.haml" do
  before(:each) do
    @sicoss_condition = assign(:sicoss_condition, stub_model(SicossCondition,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit sicoss_condition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sicoss_conditions_path(@sicoss_condition), :method => "post" do
      assert_select "input#sicoss_condition_name", :name => "sicoss_condition[name]"
      assert_select "input#sicoss_condition_company_id", :name => "sicoss_condition[company_id]"
    end
  end
end
