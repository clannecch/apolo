require 'spec_helper'

describe "sicoss_locations/new.html.haml" do
  before(:each) do
    assign(:sicoss_location, stub_model(SicossLocation,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new sicoss_location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sicoss_locations_path, :method => "post" do
      assert_select "input#sicoss_location_name", :name => "sicoss_location[name]"
      assert_select "input#sicoss_location_company_id", :name => "sicoss_location[company_id]"
    end
  end
end
