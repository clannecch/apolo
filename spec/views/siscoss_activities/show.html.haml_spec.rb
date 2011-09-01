require 'spec_helper'

describe "siscoss_activities/show.html.haml" do
  before(:each) do
    @siscoss_activity = assign(:siscoss_activity, stub_model(SiscossActivity,
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
