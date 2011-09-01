require 'spec_helper'

describe "syscoss_regimen_types/new.html.haml" do
  before(:each) do
    assign(:syscoss_regimen_type, stub_model(SyscossRegimenType,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new syscoss_regimen_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => syscoss_regimen_types_path, :method => "post" do
      assert_select "input#syscoss_regimen_type_name", :name => "syscoss_regimen_type[name]"
      assert_select "input#syscoss_regimen_type_company_id", :name => "syscoss_regimen_type[company_id]"
    end
  end
end
