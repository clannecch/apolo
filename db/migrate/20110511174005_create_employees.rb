class CreateEmployees < ActiveRecord::Migration
  def self.up
    create_table :employees do |t|
      t.string :legajo
      t.string :nombre
      t.string :apellido
      t.string :telefono
      t.integer :document_type_id
      t.decimal :numero_documento
      t.integer :issued_id
      t.string :sexo
      t.integer :nationality_id
      t.integer :marital_status_id
      t.date :fecha_nacimiento
      t.string :calle
      t.string :puerta
      t.string :piso
      t.string :departamento
      t.integer :location_id
      t.integer :province_id
      t.integer :country_id
      t.string :codigo_postal

      t.timestamps
    end
  end

  def self.down
    drop_table :employees
  end
end
