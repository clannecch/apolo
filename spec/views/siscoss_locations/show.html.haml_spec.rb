require 'spec_helper'

describe "siscoss_locations/show.html.haml" do
  before(:each) do
    @siscoss_location = assign(:siscoss_location, stub_model(SiscossLocation,
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
