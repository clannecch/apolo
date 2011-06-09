class CreateDetalleRecibos < ActiveRecord::Migration
  def self.up
    create_table :detalle_recibos do |t|
      t.integer :recibo_sueldo_id
      t.integer :remunerative_concept_id
      t.integer :retention_concept_id
      t.string :detalle
      t.string :_tipo
      t.integer :cost_center_id
      t.decimal :cantidad
      t.decimal :importe
      t.decimal :total

      t.timestamps
    end
  end

  def self.down
    drop_table :detalle_recibos
  end
end
