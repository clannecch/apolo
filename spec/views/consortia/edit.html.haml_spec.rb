require 'spec_helper'

describe "consortia/edit.html.haml" do
  before(:each) do
    @consortium = assign(:consortium, stub_model(Consortium,
      :name => "MyString",
      :calle => "MyString",
      :altura => "MyString",
      :codigo_postal => "MyString",
      :location_id => 1,
      :province_id => 1,
      :contacto_1 => "MyString",
      :telefono_1 => "MyString",
      :email_1 => "MyString",
      :contacto_2 => "MyString",
      :telefono_2 => "MyString",
      :email_2 => "MyString",
      :observaciones => "MyText",
      :cuit => "MyString",
      :numero_inscripcion => "MyString",
      :caja => "MyString",
      :ultima_hoja_libro => 1
    ))
  end

  it "renders the edit consortium form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => consortia_path(@consortium), :method => "post" do
      assert_select "input#consortium_name", :name => "consortium[name]"
      assert_select "input#consortium_calle", :name => "consortium[calle]"
      assert_select "input#consortium_altura", :name => "consortium[altura]"
      assert_select "input#consortium_codigo_postal", :name => "consortium[codigo_postal]"
      assert_select "input#consortium_location_id", :name => "consortium[location_id]"
      assert_select "input#consortium_province_id", :name => "consortium[province_id]"
      assert_select "input#consortium_contacto_1", :name => "consortium[contacto_1]"
      assert_select "input#consortium_telefono_1", :name => "consortium[telefono_1]"
      assert_select "input#consortium_email_1", :name => "consortium[email_1]"
      assert_select "input#consortium_contacto_2", :name => "consortium[contacto_2]"
      assert_select "input#consortium_telefono_2", :name => "consortium[telefono_2]"
      assert_select "input#consortium_email_2", :name => "consortium[email_2]"
      assert_select "textarea#consortium_observaciones", :name => "consortium[observaciones]"
      assert_select "input#consortium_cuit", :name => "consortium[cuit]"
      assert_select "input#consortium_numero_inscripcion", :name => "consortium[numero_inscripcion]"
      assert_select "input#consortium_caja", :name => "consortium[caja]"
      assert_select "input#consortium_ultima_hoja_libro", :name => "consortium[ultima_hoja_libro]"
    end
  end
end
