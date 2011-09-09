require 'spec_helper'

describe "sicoss_format_employers/index.html.haml" do
  before(:each) do
    assign(:sicoss_format_employers, [
      stub_model(SicossFormatEmployer,
        :sicoss_format_id => 1,
        :field_type => "Field Type",
        :formula => "Formula"
      ),
      stub_model(SicossFormatEmployer,
        :sicoss_format_id => 1,
        :field_type => "Field Type",
        :formula => "Formula"
      )
    ])
  end

  it "renders a list of sicoss_format_employers" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Field Type".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Formula".to_s, :count => 2
  end
end
