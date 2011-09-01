require 'spec_helper'

describe "sicoss_situations/show.html.haml" do
  before(:each) do
    @sicoss_situation = assign(:sicoss_situation, stub_model(SicossSituation,
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
