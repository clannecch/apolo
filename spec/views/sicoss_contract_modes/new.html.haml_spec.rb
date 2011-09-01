require 'spec_helper'

describe "sicoss_contract_modes/new.html.haml" do
  before(:each) do
    assign(:sicoss_contract_mode, stub_model(SicossContractMode,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new sicoss_contract_mode form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sicoss_contract_modes_path, :method => "post" do
      assert_select "input#sicoss_contract_mode_name", :name => "sicoss_contract_mode[name]"
      assert_select "input#sicoss_contract_mode_company_id", :name => "sicoss_contract_mode[company_id]"
    end
  end
end
