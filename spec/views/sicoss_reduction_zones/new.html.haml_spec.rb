require 'spec_helper'

describe "sicoss_reduction_zones/new.html.haml" do
  before(:each) do
    assign(:sicoss_reduction_zone, stub_model(SicossReductionZone,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new sicoss_reduction_zone form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sicoss_reduction_zones_path, :method => "post" do
      assert_select "input#sicoss_reduction_zone_name", :name => "sicoss_reduction_zone[name]"
      assert_select "input#sicoss_reduction_zone_company_id", :name => "sicoss_reduction_zone[company_id]"
    end
  end
end
