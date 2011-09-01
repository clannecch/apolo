require 'spec_helper'

describe "syscoss_locations/show.html.haml" do
  before(:each) do
    @syscoss_location = assign(:syscoss_location, stub_model(SyscossLocation,
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
