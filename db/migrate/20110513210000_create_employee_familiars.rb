class CreateEmployeeFamiliars < ActiveRecord::Migration
  def self.up
    create_table :employee_familiars do |t|
      t.string :apellido
      t.string :nombre
      t.date :fecha_nacimiento
      t.integer :numero_documento
      t.integer :health_insurance_id
      t.string :cuil
      t.string :cuit
      t.string :tomo
      t.string :folio
      t.string :acta
      t.integer :country_id
      t.integer :province_id
      t.string :comuna
      t.integer :employee_id
      t.integer :document_type_id
      t.integer :activity_id

      t.timestamps
    end
  end

  def self.down
    drop_table :employee_familiars
  end
end
