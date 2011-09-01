require 'spec_helper'

describe "siscoss_activities/new.html.haml" do
  before(:each) do
    assign(:siscoss_activity, stub_model(SiscossActivity,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new siscoss_activity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => siscoss_activities_path, :method => "post" do
      assert_select "input#siscoss_activity_name", :name => "siscoss_activity[name]"
      assert_select "input#siscoss_activity_company_id", :name => "siscoss_activity[company_id]"
    end
  end
end
