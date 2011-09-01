require 'spec_helper'

describe "syscoss_conditions/new.html.haml" do
  before(:each) do
    assign(:syscoss_condition, stub_model(SyscossCondition,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new syscoss_condition form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => syscoss_conditions_path, :method => "post" do
      assert_select "input#syscoss_condition_name", :name => "syscoss_condition[name]"
      assert_select "input#syscoss_condition_company_id", :name => "syscoss_condition[company_id]"
    end
  end
end
