require 'spec_helper'

describe "sicoss_conditions/new.html.haml" do
  before(:each) do
    assign(:sicoss_condition, stub_model(SicossCondition,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new sicoss_condition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sicoss_conditions_path, :method => "post" do
      assert_select "input#sicoss_condition_name", :name => "sicoss_condition[name]"
      assert_select "input#sicoss_condition_company_id", :name => "sicoss_condition[company_id]"
    end
  end
end
