require 'spec_helper'

describe "siscoss_regimen/new.html.haml" do
  before(:each) do
    assign(:siscoss_regiman, stub_model(SiscossRegiman,
      :name => "MyString",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new siscoss_regiman form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => siscoss_regimen_path, :method => "post" do
      assert_select "input#siscoss_regiman_name", :name => "siscoss_regiman[name]"
      assert_select "input#siscoss_regiman_company_id", :name => "siscoss_regiman[company_id]"
    end
  end
end
