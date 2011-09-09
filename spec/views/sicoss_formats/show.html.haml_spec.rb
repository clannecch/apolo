require 'spec_helper'

describe "sicoss_formats/show.html.haml" do
  before(:each) do
    @sicoss_format = assign(:sicoss_format, stub_model(SicossFormat,
      :position => 1,
      :name => "Name",
      :field_length => 1,
      :Number_of_decimals => 1,
      :justifies => "Justifies",
      :fill_character => "Fill Character",
      :formula => "Formula",
      :company_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Justifies/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Fill Character/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Formula/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
