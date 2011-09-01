require 'spec_helper'

describe "siscoss_regimen_types/new.html.haml" do
  before(:each) do
    assign(:siscoss_regimen_type, stub_model(SiscossRegimenType,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new siscoss_regimen_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => siscoss_regimen_types_path, :method => "post" do
      assert_select "input#siscoss_regimen_type_name", :name => "siscoss_regimen_type[name]"
      assert_select "input#siscoss_regimen_type_company_id", :name => "siscoss_regimen_type[company_id]"
    end
  end
end
