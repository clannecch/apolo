require 'spec_helper'

describe "syscoss_damageds/show.html.haml" do
  before(:each) do
    @syscoss_damaged = assign(:syscoss_damaged, stub_model(SyscossDamaged,
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
