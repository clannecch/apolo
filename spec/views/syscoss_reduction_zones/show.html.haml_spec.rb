require 'spec_helper'

describe "syscoss_reduction_zones/show.html.haml" do
  before(:each) do
    @syscoss_reduction_zone = assign(:syscoss_reduction_zone, stub_model(SyscossReductionZone,
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
