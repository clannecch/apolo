require 'spec_helper'

describe "siscoss_situations/edit.html.haml" do
  before(:each) do
    @siscoss_situation = assign(:siscoss_situation, stub_model(SiscossSituation,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit siscoss_situation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => siscoss_situations_path(@siscoss_situation), :method => "post" do
      assert_select "input#siscoss_situation_name", :name => "siscoss_situation[name]"
      assert_select "input#siscoss_situation_company_id", :name => "siscoss_situation[company_id]"
    end
  end
end
