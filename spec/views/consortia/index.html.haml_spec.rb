require 'spec_helper'

describe "consortia/index.html.haml" do
  before(:each) do
    assign(:consortia, [
      stub_model(Consortium,
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
      ),
      stub_model(Consortium,
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
      )
    ])
  end

  it "renders a list of consortia" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Calle".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Altura".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Codigo Postal".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Localidad".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contacto 1".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Telefono 1".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email 1".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contacto 2".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Telefono 2".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email 2".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Cuit".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Numero Inscripcion".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Caja".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
