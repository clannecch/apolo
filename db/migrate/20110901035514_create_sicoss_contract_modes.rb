class CreateSicossContractModes < ActiveRecord::Migration
  def self.up
    create_table :sicoss_contract_modes do |t|
      t.string :name
      t.integer :company_id

      t.timestamps
    end
  end

  def self.down
    drop_table :sicoss_contract_modes
  end
end
