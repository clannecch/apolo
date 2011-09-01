require 'spec_helper'

describe "syscoss_contract_modes/new.html.haml" do
  before(:each) do
    assign(:syscoss_contract_mode, stub_model(SyscossContractMode,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new syscoss_contract_mode form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => syscoss_contract_modes_path, :method => "post" do
      assert_select "input#syscoss_contract_mode_name", :name => "syscoss_contract_mode[name]"
      assert_select "input#syscoss_contract_mode_company_id", :name => "syscoss_contract_mode[company_id]"
    end
  end
end
