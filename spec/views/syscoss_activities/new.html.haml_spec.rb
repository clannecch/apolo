require 'spec_helper'

describe "syscoss_activities/new.html.haml" do
  before(:each) do
    assign(:syscoss_activity, stub_model(SyscossActivity,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new syscoss_activity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => syscoss_activities_path, :method => "post" do
      assert_select "input#syscoss_activity_name", :name => "syscoss_activity[name]"
      assert_select "input#syscoss_activity_company_id", :name => "syscoss_activity[company_id]"
    end
  end
end
