require 'spec_helper'

describe "syscoss_locations/new.html.haml" do
  before(:each) do
    assign(:syscoss_location, stub_model(SyscossLocation,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new syscoss_location form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => syscoss_locations_path, :method => "post" do
      assert_select "input#syscoss_location_name", :name => "syscoss_location[name]"
      assert_select "input#syscoss_location_company_id", :name => "syscoss_location[company_id]"
    end
  end
end
