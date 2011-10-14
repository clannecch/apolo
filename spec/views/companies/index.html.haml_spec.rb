require 'spec_helper'

describe "companies/index.html.haml" do
  before(:each) do
    assign(:companies, [
      stub_model(Company,
        :code => "",
        :detalle => "Detalle",
        :domicilio => "Domicilio",
        :telefono => "",
        :contacto => "Contacto",
        :observaciones => "MyText",
        :email => "Email",
        :cuit => "Cuit",
        :razon_social => "Razon Social"
      ),
      stub_model(Company,
        :code => "",
        :detalle => "Detalle",
        :domicilio => "Domicilio",
        :telefono => "",
        :contacto => "Contacto",
        :observaciones => "MyText",
        :email => "Email",
        :cuit => "Cuit",
        :razon_social => "Razon Social"
      )
    ])
  end

  it "renders a list of companies" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Detalle".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Domicilio".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contacto".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Cuit".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Razon Social".to_s, :count => 2
  end
end
