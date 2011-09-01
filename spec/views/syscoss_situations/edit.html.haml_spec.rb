require 'spec_helper'

describe "syscoss_situations/edit.html.haml" do
  before(:each) do
    @syscoss_situation = assign(:syscoss_situation, stub_model(SyscossSituation,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit syscoss_situation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => syscoss_situations_path(@syscoss_situation), :method => "post" do
      assert_select "input#syscoss_situation_name", :name => "syscoss_situation[name]"
      assert_select "input#syscoss_situation_company_id", :name => "syscoss_situation[company_id]"
    end
  end
end
