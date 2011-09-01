require 'spec_helper'

describe "sicoss_regimen_types/new.html.haml" do
  before(:each) do
    assign(:sicoss_regimen_type, stub_model(SicossRegimenType,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new sicoss_regimen_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sicoss_regimen_types_path, :method => "post" do
      assert_select "input#sicoss_regimen_type_name", :name => "sicoss_regimen_type[name]"
      assert_select "input#sicoss_regimen_type_company_id", :name => "sicoss_regimen_type[company_id]"
    end
  end
end
