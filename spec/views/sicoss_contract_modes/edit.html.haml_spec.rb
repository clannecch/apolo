require 'spec_helper'

describe "sicoss_contract_modes/edit.html.haml" do
  before(:each) do
    @sicoss_contract_mode = assign(:sicoss_contract_mode, stub_model(SicossContractMode,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit sicoss_contract_mode form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sicoss_contract_modes_path(@sicoss_contract_mode), :method => "post" do
      assert_select "input#sicoss_contract_mode_name", :name => "sicoss_contract_mode[name]"
      assert_select "input#sicoss_contract_mode_company_id", :name => "sicoss_contract_mode[company_id]"
    end
  end
end
