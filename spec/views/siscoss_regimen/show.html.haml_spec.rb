require 'spec_helper'

describe "siscoss_regimen/show.html.haml" do
  before(:each) do
    @siscoss_regiman = assign(:siscoss_regiman, stub_model(SiscossRegiman,
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
