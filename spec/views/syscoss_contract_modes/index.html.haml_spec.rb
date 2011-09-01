require 'spec_helper'

describe "syscoss_contract_modes/index.html.haml" do
  before(:each) do
    assign(:syscoss_contract_modes, [
      stub_model(SyscossContractMode,
        :name => "Name",
        :company_id => 1
      ),
      stub_model(SyscossContractMode,
        :name => "Name",
        :company_id => 1
      )
    ])
  end

  it "renders a list of syscoss_contract_modes" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
