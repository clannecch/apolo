require 'spec_helper'

describe "companies/show.html.haml" do
  before(:each) do
    @company = assign(:company, stub_model(Company,
      :code => "",
      :detalle => "Detalle",
      :domicilio => "Domicilio",
      :telefono => "",
      :contacto => "Contacto",
      :observaciones => "MyText",
      :email => "Email",
      :cuit => "Cuit",
      :razon_social => "Razon Social"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Detalle/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Domicilio/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contacto/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Cuit/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Razon Social/)
  end
end
