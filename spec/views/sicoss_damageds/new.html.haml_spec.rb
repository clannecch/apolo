require 'spec_helper'

describe "sicoss_damageds/new.html.haml" do
  before(:each) do
    assign(:sicoss_damaged, stub_model(SicossDamaged,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new sicoss_damaged form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sicoss_damageds_path, :method => "post" do
      assert_select "input#sicoss_damaged_name", :name => "sicoss_damaged[name]"
      assert_select "input#sicoss_damaged_company_id", :name => "sicoss_damaged[company_id]"
    end
  end
end
