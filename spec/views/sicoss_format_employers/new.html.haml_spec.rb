require 'spec_helper'

describe "sicoss_format_employers/new.html.haml" do
  before(:each) do
    assign(:sicoss_format_employer, stub_model(SicossFormatEmployer,
      :sicoss_format_id => 1,
      :field_type => "MyString",
      :formula => "MyString"
    ).as_new_record)
  end

  it "renders new sicoss_format_employer form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => sicoss_format_employers_path, :method => "post" do
      assert_select "input#sicoss_format_employer_sicoss_format_id", :name => "sicoss_format_employer[sicoss_format_id]"
      assert_select "input#sicoss_format_employer_field_type", :name => "sicoss_format_employer[field_type]"
      assert_select "input#sicoss_format_employer_formula", :name => "sicoss_format_employer[formula]"
    end
  end
end
