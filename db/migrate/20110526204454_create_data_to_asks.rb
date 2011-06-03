class CreateDataToAsks < ActiveRecord::Migration
  def self.up
    create_table :data_to_asks do |t|
      t.string :detalle
      t.boolean :cantidad
      t.boolean :importe

      t.timestamps
    end
  end

  def self.down
    drop_table :data_to_asks
  end
end
