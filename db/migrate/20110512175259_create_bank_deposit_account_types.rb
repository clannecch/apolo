class CreateBankDepositAccountTypes < ActiveRecord::Migration
  def self.up
    create_table :bank_deposit_account_types do |t|
      t.string :detalle

      t.timestamps
    end
  end

  def self.down
    drop_table :bank_deposit_account_types
  end
end
