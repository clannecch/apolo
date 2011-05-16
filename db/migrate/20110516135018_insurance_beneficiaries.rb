class InsuranceBeneficiaries < ActiveRecord::Migration
  def self.up
  	add_column :insurance_beneficiaries, :employee_id, :integer
  end

  def self.down
  	remove_column :insurance_beneficiaries, :employee_id
  end
end
