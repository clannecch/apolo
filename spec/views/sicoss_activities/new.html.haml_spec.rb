require 'spec_helper'

describe "sicoss_activities/new.html.haml" do
  before(:each) do
    assign(:sicoss_activity, stub_model(SicossActivity,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new sicoss_activity form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sicoss_activities_path, :method => "post" do
      assert_select "input#sicoss_activity_name", :name => "sicoss_activity[name]"
      assert_select "input#sicoss_activity_company_id", :name => "sicoss_activity[company_id]"
    end
  end
end
