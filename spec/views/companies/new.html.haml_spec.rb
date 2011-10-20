require 'spec_helper'

describe "companies/new.html.haml" do
  before(:each) do
    assign(:company, stub_model(Company,
      :code => "",
      :detalle => "MyString",
      :domicilio => "MyString",
      :telefono => "",
      :contacto => "MyString",
      :observaciones => "MyText",
      :email => "MyString",
      :cuit => "MyString",
      :razon_social => "MyString"
    ).as_new_record)
  end

  it "renders new company form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => companies_path, :method => "post" do
      assert_select "input#company_code", :name => "company[code]"
      assert_select "input#company_detalle", :name => "company[detalle]"
      assert_select "input#company_domicilio", :name => "company[domicilio]"
      assert_select "input#company_telefono", :name => "company[telefono]"
      assert_select "input#company_contacto", :name => "company[contacto]"
      assert_select "textarea#company_observaciones", :name => "company[observaciones]"
      assert_select "input#company_email", :name => "company[email]"
      assert_select "input#company_cuit", :name => "company[cuit]"
      assert_select "input#company_razon_social", :name => "company[razon_social]"
    end
  end
end
