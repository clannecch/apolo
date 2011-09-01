require 'spec_helper'

describe "syscoss_regimen_types/edit.html.haml" do
  before(:each) do
    @syscoss_regimen_type = assign(:syscoss_regimen_type, stub_model(SyscossRegimenType,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit syscoss_regimen_type form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => syscoss_regimen_types_path(@syscoss_regimen_type), :method => "post" do
      assert_select "input#syscoss_regimen_type_name", :name => "syscoss_regimen_type[name]"
      assert_select "input#syscoss_regimen_type_company_id", :name => "syscoss_regimen_type[company_id]"
    end
  end
end
