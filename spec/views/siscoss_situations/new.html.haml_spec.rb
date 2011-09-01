require 'spec_helper'

describe "siscoss_situations/new.html.haml" do
  before(:each) do
    assign(:siscoss_situation, stub_model(SiscossSituation,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new siscoss_situation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => siscoss_situations_path, :method => "post" do
      assert_select "input#siscoss_situation_name", :name => "siscoss_situation[name]"
      assert_select "input#siscoss_situation_company_id", :name => "siscoss_situation[company_id]"
    end
  end
end
