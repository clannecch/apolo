require 'spec_helper'

describe "siscoss_contract_modes/edit.html.haml" do
  before(:each) do
    @siscoss_contract_mode = assign(:siscoss_contract_mode, stub_model(SiscossContractMode,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit siscoss_contract_mode form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => siscoss_contract_modes_path(@siscoss_contract_mode), :method => "post" do
      assert_select "input#siscoss_contract_mode_name", :name => "siscoss_contract_mode[name]"
      assert_select "input#siscoss_contract_mode_company_id", :name => "siscoss_contract_mode[company_id]"
    end
  end
end
