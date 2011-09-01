require 'spec_helper'

describe "siscoss_conditions/edit.html.haml" do
  before(:each) do
    @siscoss_condition = assign(:siscoss_condition, stub_model(SiscossCondition,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit siscoss_condition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => siscoss_conditions_path(@siscoss_condition), :method => "post" do
      assert_select "input#siscoss_condition_name", :name => "siscoss_condition[name]"
      assert_select "input#siscoss_condition_company_id", :name => "siscoss_condition[company_id]"
    end
  end
end
