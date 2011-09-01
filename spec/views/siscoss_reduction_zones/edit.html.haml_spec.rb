require 'spec_helper'

describe "siscoss_reduction_zones/edit.html.haml" do
  before(:each) do
    @siscoss_reduction_zone = assign(:siscoss_reduction_zone, stub_model(SiscossReductionZone,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit siscoss_reduction_zone form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => siscoss_reduction_zones_path(@siscoss_reduction_zone), :method => "post" do
      assert_select "input#siscoss_reduction_zone_name", :name => "siscoss_reduction_zone[name]"
      assert_select "input#siscoss_reduction_zone_company_id", :name => "siscoss_reduction_zone[company_id]"
    end
  end
end
