class AddKinshipAddressAndPorcentualToInsuranceBeneficiary < ActiveRecord::Migration
  def self.up
    add_column :insurance_beneficiaries, :address, :string
    add_column :insurance_beneficiaries, :kinship_id, :integer
    add_column :insurance_beneficiaries, :porcentual, :decimal
  end

  def self.down
    remove_column :insurance_beneficiaries, :porcentual
    remove_column :insurance_beneficiaries, :kinship_id
    remove_column :insurance_beneficiaries, :address
  end
end
