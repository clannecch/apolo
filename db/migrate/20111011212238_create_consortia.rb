class CreateConsortia < ActiveRecord::Migration
  def self.up
    create_table :consortia do |t|
      t.string :code
      t.string :name
      t.string :razon_social
      t.string :calle
      t.string :altura
      t.string :codigo_postal
      t.integer :location_id
      t.integer :province_id
      t.float :latitude
      t.float :longitude
      t.string :telefono
      t.string :contacto
      t.string :email
      t.string :cuit
      t.string :numero_inscripcion
      t.string :caja
      t.string :ultima_hoja_libro
      t.string :imprimir_hasta_hoja_libro
      t.text :observaciones
      t.integer :company_id

      t.timestamps
    end
  end

  def self.down
    drop_table :consortia
  end
end
