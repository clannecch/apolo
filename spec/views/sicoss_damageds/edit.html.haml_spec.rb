require 'spec_helper'

describe "sicoss_damageds/edit.html.haml" do
  before(:each) do
    @sicoss_damaged = assign(:sicoss_damaged, stub_model(SicossDamaged,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit sicoss_damaged form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sicoss_damageds_path(@sicoss_damaged), :method => "post" do
      assert_select "input#sicoss_damaged_name", :name => "sicoss_damaged[name]"
      assert_select "input#sicoss_damaged_company_id", :name => "sicoss_damaged[company_id]"
    end
  end
end
