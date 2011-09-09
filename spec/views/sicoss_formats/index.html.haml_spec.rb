require 'spec_helper'

describe "sicoss_formats/index.html.haml" do
  before(:each) do
    assign(:sicoss_formats, [
      stub_model(SicossFormat,
        :position => 1,
        :name => "Name",
        :field_length => 1,
        :Number_of_decimals => 1,
        :justifies => "Justifies",
        :fill_character => "Fill Character",
        :formula => "Formula",
        :company_id => 1
      ),
      stub_model(SicossFormat,
        :position => 1,
        :name => "Name",
        :field_length => 1,
        :Number_of_decimals => 1,
        :justifies => "Justifies",
        :fill_character => "Fill Character",
        :formula => "Formula",
        :company_id => 1
      )
    ])
  end

  it "renders a list of sicoss_formats" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Justifies".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Fill Character".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Formula".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
