require 'spec_helper'

describe "syscoss_conditions/edit.html.haml" do
  before(:each) do
    @syscoss_condition = assign(:syscoss_condition, stub_model(SyscossCondition,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit syscoss_condition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => syscoss_conditions_path(@syscoss_condition), :method => "post" do
      assert_select "input#syscoss_condition_name", :name => "syscoss_condition[name]"
      assert_select "input#syscoss_condition_company_id", :name => "syscoss_condition[company_id]"
    end
  end
end
