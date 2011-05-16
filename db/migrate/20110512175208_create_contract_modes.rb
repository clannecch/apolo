class CreateContractModes < ActiveRecord::Migration
  def self.up
    create_table :contract_modes do |t|
      t.string :detalle

      t.timestamps
    end
  end

  def self.down
    drop_table :contract_modes
  end
end
