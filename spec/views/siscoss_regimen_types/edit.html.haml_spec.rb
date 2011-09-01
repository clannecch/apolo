require 'spec_helper'

describe "siscoss_regimen_types/edit.html.haml" do
  before(:each) do
    @siscoss_regimen_type = assign(:siscoss_regimen_type, stub_model(SiscossRegimenType,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit siscoss_regimen_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => siscoss_regimen_types_path(@siscoss_regimen_type), :method => "post" do
      assert_select "input#siscoss_regimen_type_name", :name => "siscoss_regimen_type[name]"
      assert_select "input#siscoss_regimen_type_company_id", :name => "siscoss_regimen_type[company_id]"
    end
  end
end
