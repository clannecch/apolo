require 'spec_helper'

describe "siscoss_locations/index.html.haml" do
  before(:each) do
    assign(:siscoss_locations, [
      stub_model(SiscossLocation,
        :name => "Name",
        :company_id => 1
      ),
      stub_model(SiscossLocation,
        :name => "Name",
        :company_id => 1
      )
    ])
  end

  it "renders a list of siscoss_locations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
