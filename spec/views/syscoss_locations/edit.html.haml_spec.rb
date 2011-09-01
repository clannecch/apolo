require 'spec_helper'

describe "syscoss_locations/edit.html.haml" do
  before(:each) do
    @syscoss_location = assign(:syscoss_location, stub_model(SyscossLocation,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit syscoss_location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => syscoss_locations_path(@syscoss_location), :method => "post" do
      assert_select "input#syscoss_location_name", :name => "syscoss_location[name]"
      assert_select "input#syscoss_location_company_id", :name => "syscoss_location[company_id]"
    end
  end
end
