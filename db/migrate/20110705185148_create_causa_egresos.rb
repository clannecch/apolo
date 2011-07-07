class CreateCausaEgresos < ActiveRecord::Migration
  def self.up
    create_table :causa_egresos do |t|
      t.string :detalle

      t.timestamps
    end
  end

  def self.down
    drop_table :causa_egresos
  end
end
