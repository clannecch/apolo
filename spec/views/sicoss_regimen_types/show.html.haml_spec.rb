require 'spec_helper'

describe "sicoss_regimen_types/show.html.haml" do
  before(:each) do
    @sicoss_regimen_type = assign(:sicoss_regimen_type, stub_model(SicossRegimenType,
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
