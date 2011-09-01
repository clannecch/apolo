require 'spec_helper'

describe "siscoss_activities/edit.html.haml" do
  before(:each) do
    @siscoss_activity = assign(:siscoss_activity, stub_model(SiscossActivity,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit siscoss_activity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => siscoss_activities_path(@siscoss_activity), :method => "post" do
      assert_select "input#siscoss_activity_name", :name => "siscoss_activity[name]"
      assert_select "input#siscoss_activity_company_id", :name => "siscoss_activity[company_id]"
    end
  end
end
