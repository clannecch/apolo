require 'spec_helper'

describe "syscoss_damageds/edit.html.haml" do
  before(:each) do
    @syscoss_damaged = assign(:syscoss_damaged, stub_model(SyscossDamaged,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit syscoss_damaged form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => syscoss_damageds_path(@syscoss_damaged), :method => "post" do
      assert_select "input#syscoss_damaged_name", :name => "syscoss_damaged[name]"
      assert_select "input#syscoss_damaged_company_id", :name => "syscoss_damaged[company_id]"
    end
  end
end
