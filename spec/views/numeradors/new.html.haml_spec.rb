require 'spec_helper'

describe "numeradors/new.html.haml" do
  before(:each) do
    assign(:numerador, stub_model(Numerador,
      :code => "MyString",
      :name => "MyString",
      :number => "9.99",
      :company_id => 1
    ).as_new_record)
  end

  it "renders new numerador form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => numeradors_path, :method => "post" do
      assert_select "input#numerador_code", :name => "numerador[code]"
      assert_select "input#numerador_name", :name => "numerador[name]"
      assert_select "input#numerador_number", :name => "numerador[number]"
      assert_select "input#numerador_company_id", :name => "numerador[company_id]"
    end
  end
end
