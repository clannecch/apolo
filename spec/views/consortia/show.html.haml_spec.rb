require 'spec_helper'

describe "consortia/show.html.haml" do
  before(:each) do
    @consortium = assign(:consortium, stub_model(Consortium,
      :name => "Name",
      :calle => "Calle",
      :altura => "Altura",
      :codigo_postal => "Codigo Postal",
      :localidad => "Localidad",
      :province_id => 1,
      :contacto_1 => "Contacto 1",
      :telefono_1 => "Telefono 1",
      :email_1 => "Email 1",
      :contacto_2 => "Contacto 2",
      :telefono_2 => "Telefono 2",
      :email_2 => "Email 2",
      :observaciones => "MyText",
      :cuit => "Cuit",
      :numero_inscripcion => "Numero Inscripcion",
      :caja => "Caja",
      :ultima_hoja_libro => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Calle/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Altura/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Codigo Postal/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Localidad/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contacto 1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Telefono 1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email 1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Contacto 2/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Telefono 2/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email 2/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Cuit/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Numero Inscripcion/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Caja/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
