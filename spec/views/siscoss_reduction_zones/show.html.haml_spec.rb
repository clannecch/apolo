require 'spec_helper'

describe "siscoss_reduction_zones/show.html.haml" do
  before(:each) do
    @siscoss_reduction_zone = assign(:siscoss_reduction_zone, stub_model(SiscossReductionZone,
      :name => "Name",
      :company_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
