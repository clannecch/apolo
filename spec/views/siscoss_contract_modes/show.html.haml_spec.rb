require 'spec_helper'

describe "siscoss_contract_modes/show.html.haml" do
  before(:each) do
    @siscoss_contract_mode = assign(:siscoss_contract_mode, stub_model(SiscossContractMode,
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
