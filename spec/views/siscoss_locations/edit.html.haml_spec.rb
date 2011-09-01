require 'spec_helper'

describe "siscoss_locations/edit.html.haml" do
  before(:each) do
    @siscoss_location = assign(:siscoss_location, stub_model(SiscossLocation,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit siscoss_location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => siscoss_locations_path(@siscoss_location), :method => "post" do
      assert_select "input#siscoss_location_name", :name => "siscoss_location[name]"
      assert_select "input#siscoss_location_company_id", :name => "siscoss_location[company_id]"
    end
  end
end
