require 'spec_helper'

describe "syscoss_reduction_zones/new.html.haml" do
  before(:each) do
    assign(:syscoss_reduction_zone, stub_model(SyscossReductionZone,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new syscoss_reduction_zone form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => syscoss_reduction_zones_path, :method => "post" do
      assert_select "input#syscoss_reduction_zone_name", :name => "syscoss_reduction_zone[name]"
      assert_select "input#syscoss_reduction_zone_company_id", :name => "syscoss_reduction_zone[company_id]"
    end
  end
end
