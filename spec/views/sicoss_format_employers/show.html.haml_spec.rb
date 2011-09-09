require 'spec_helper'

describe "sicoss_format_employers/show.html.haml" do
  before(:each) do
    @sicoss_format_employer = assign(:sicoss_format_employer, stub_model(SicossFormatEmployer,
      :sicoss_format_id => 1,
      :field_type => "Field Type",
      :formula => "Formula"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Field Type/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Formula/)
  end
end
