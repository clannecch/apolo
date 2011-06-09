class CreateLiquidacions < ActiveRecord::Migration
  def self.up
    create_table :liquidacions do |t|
      t.string :periodo
      t.date :fecha_liquidacion
      t.date :fecha_deposito
      t.integer :bank_deposit_id
      t.string :periodo_deposito
      t.date :fecha_deposito
      t.date :fecha_cierre
      t.integer :quincena
      t.decimal :techo_retenciones

      t.timestamps
    end
  end

  def self.down
    drop_table :liquidacions
  end
end
