require 'spec_helper'

describe "siscoss_regimen/edit.html.haml" do
  before(:each) do
    @siscoss_regiman = assign(:siscoss_regiman, stub_model(SiscossRegiman,
      :name => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit siscoss_regiman form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => siscoss_regimen_path(@siscoss_regiman), :method => "post" do
      assert_select "input#siscoss_regiman_name", :name => "siscoss_regiman[name]"
      assert_select "input#siscoss_regiman_company_id", :name => "siscoss_regiman[company_id]"
    end
  end
end
