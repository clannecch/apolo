class CreateInsuranceBeneficiaries < ActiveRecord::Migration
  def self.up
    create_table :insurance_beneficiaries do |t|
      t.string :nombre
      t.string :apellido
      t.integer :document_type_id
      t.integer :numero_documento

      t.timestamps
    end
  end

  def self.down
    drop_table :insurance_beneficiaries
  end
end
