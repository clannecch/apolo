class AddFechaNacimientoToInsuranceBeneficiary < ActiveRecord::Migration
  def self.up
    add_column :insurance_beneficiaries, :fecha_nacimiento, :date
  end

  def self.down
    remove_column :insurance_beneficiaries, :fecha_nacimiento
  end
end
