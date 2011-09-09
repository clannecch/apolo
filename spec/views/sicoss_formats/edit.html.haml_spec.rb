require 'spec_helper'

describe "sicoss_formats/edit.html.haml" do
  before(:each) do
    @sicoss_format = assign(:sicoss_format, stub_model(SicossFormat,
      :position => 1,
      :name => "MyString",
      :field_length => 1,
      :Number_of_decimals => 1,
      :justifies => "MyString",
      :fill_character => "MyString",
      :formula => "MyString",
      :company_id => 1
    ))
  end

  it "renders the edit sicoss_format form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sicoss_formats_path(@sicoss_format), :method => "post" do
      assert_select "input#sicoss_format_position", :name => "sicoss_format[position]"
      assert_select "input#sicoss_format_name", :name => "sicoss_format[name]"
      assert_select "input#sicoss_format_field_length", :name => "sicoss_format[field_length]"
      assert_select "input#sicoss_format_Number_of_decimals", :name => "sicoss_format[Number_of_decimals]"
      assert_select "input#sicoss_format_justifies", :name => "sicoss_format[justifies]"
      assert_select "input#sicoss_format_fill_character", :name => "sicoss_format[fill_character]"
      assert_select "input#sicoss_format_formula", :name => "sicoss_format[formula]"
      assert_select "input#sicoss_format_company_id", :name => "sicoss_format[company_id]"
    end
  end
end
