class AddDataToCompany < ActiveRecord::Migration
  def self.up
    add_column :companies, :code, :string
    add_column :companies, :razon_social, :string
    add_column :companies, :calle, :string
    add_column :companies, :altura, :string
    add_column :companies, :codigo_postal, :string
    add_column :companies, :location_id, :integer
    add_column :companies, :province_id, :integer
    add_column :companies, :latitude,  :float
    add_column :companies, :longitude, :float
    add_column :companies, :telefono, :string
    add_column :companies, :contacto, :string
    add_column :companies, :email, :string
    add_column :companies, :cuit, :string
    add_column :companies, :numero_inscripcion, :string
    add_column :companies, :caja, :string
    add_column :companies, :ultima_hoja_libro, :integer
    add_column :companies, :imprimir_hasta_hoja_libro, :integer
    add_column :companies, :observaciones, :text
  end

  def self.down
    remove_column :companies, :observaciones
    remove_column :companies, :imprimir_hasta_hoja_libro
    remove_column :companies, :ultima_hoja_libro
    remove_column :companies, :caja
    remove_column :companies, :numero_inscripcion
    remove_column :companies, :cuit
    remove_column :companies, :email
    remove_column :companies, :contacto
    remove_column :companies, :telefono
    remove_column :companies, :longitude
    remove_column :companies, :latitude
    remove_column :companies, :province_id
    remove_column :companies, :location_id
    remove_column :companies, :codigo_postal
    remove_column :companies, :altura
    remove_column :companies, :calle
    remove_column :companies, :razon_social
    remove_column :companies, :code
  end
end
