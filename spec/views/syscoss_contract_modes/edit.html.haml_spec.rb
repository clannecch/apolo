require 'spec_helper'

describe "syscoss_contract_modes/edit.html.haml" do
  before(:each) do
    @syscoss_contract_mode = assign(:syscoss_contract_mode, stub_model(SyscossContractMode,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit syscoss_contract_mode form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => syscoss_contract_modes_path(@syscoss_contract_mode), :method => "post" do
      assert_select "input#syscoss_contract_mode_name", :name => "syscoss_contract_mode[name]"
      assert_select "input#syscoss_contract_mode_company_id", :name => "syscoss_contract_mode[company_id]"
    end
  end
end
