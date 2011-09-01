require 'spec_helper'

describe "sicoss_situations/new.html.haml" do
  before(:each) do
    assign(:sicoss_situation, stub_model(SicossSituation,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new sicoss_situation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sicoss_situations_path, :method => "post" do
      assert_select "input#sicoss_situation_name", :name => "sicoss_situation[name]"
      assert_select "input#sicoss_situation_company_id", :name => "sicoss_situation[company_id]"
    end
  end
end
