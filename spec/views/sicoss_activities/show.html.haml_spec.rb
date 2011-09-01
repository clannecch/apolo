require 'spec_helper'

describe "sicoss_activities/show.html.haml" do
  before(:each) do
    @sicoss_activity = assign(:sicoss_activity, stub_model(SicossActivity,
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
