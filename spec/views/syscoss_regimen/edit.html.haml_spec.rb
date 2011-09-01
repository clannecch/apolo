require 'spec_helper'

describe "syscoss_regimen/edit.html.haml" do
  before(:each) do
    @syscoss_regiman = assign(:syscoss_regiman, stub_model(SyscossRegiman,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit syscoss_regiman form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => syscoss_regimen_path(@syscoss_regiman), :method => "post" do
      assert_select "input#syscoss_regiman_name", :name => "syscoss_regiman[name]"
      assert_select "input#syscoss_regiman_company_id", :name => "syscoss_regiman[company_id]"
    end
  end
end
