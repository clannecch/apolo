require 'spec_helper'

describe "numeradors/index.html.haml" do
  before(:each) do
    assign(:numeradors, [
      stub_model(Numerador,
        :code => "Code",
        :name => "Name",
        :number => "9.99",
        :company_id => 1
      ),
      stub_model(Numerador,
        :code => "Code",
        :name => "Name",
        :number => "9.99",
        :company_id => 1
      )
    ])
  end

  it "renders a list of numeradors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
