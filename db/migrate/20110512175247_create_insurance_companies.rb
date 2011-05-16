class CreateInsuranceCompanies < ActiveRecord::Migration
  def self.up
    create_table :insurance_companies do |t|
      t.string :detalle

      t.timestamps
    end
  end

  def self.down
    drop_table :insurance_companies
  end
end
