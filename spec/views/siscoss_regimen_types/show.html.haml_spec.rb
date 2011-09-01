require 'spec_helper'

describe "siscoss_regimen_types/show.html.haml" do
  before(:each) do
    @siscoss_regimen_type = assign(:siscoss_regimen_type, stub_model(SiscossRegimenType,
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
