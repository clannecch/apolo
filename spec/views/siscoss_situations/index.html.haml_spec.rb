require 'spec_helper'

describe "siscoss_situations/index.html.haml" do
  before(:each) do
    assign(:siscoss_situations, [
      stub_model(SiscossSituation,
        :name => "Name",
        :company_id => 1
      ),
      stub_model(SiscossSituation,
        :name => "Name",
        :company_id => 1
      )
    ])
  end

  it "renders a list of siscoss_situations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
