class CreateAccountingImputations < ActiveRecord::Migration
  def self.up
    create_table :accounting_imputations do |t|
      t.string :detalle

      t.timestamps
    end
  end

  def self.down
    drop_table :accounting_imputations
  end
end
