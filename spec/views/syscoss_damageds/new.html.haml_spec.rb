require 'spec_helper'

describe "syscoss_damageds/new.html.haml" do
  before(:each) do
    assign(:syscoss_damaged, stub_model(SyscossDamaged,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new syscoss_damaged form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => syscoss_damageds_path, :method => "post" do
      assert_select "input#syscoss_damaged_name", :name => "syscoss_damaged[name]"
      assert_select "input#syscoss_damaged_company_id", :name => "syscoss_damaged[company_id]"
    end
  end
end
