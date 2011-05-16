class CreateBankDeposits < ActiveRecord::Migration
  def self.up
    create_table :bank_deposits do |t|
      t.string :detalle

      t.timestamps
    end
  end

  def self.down
    drop_table :bank_deposits
  end
end
