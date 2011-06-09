class CreateTipoRecibos < ActiveRecord::Migration
  def self.up
    create_table :tipo_recibos do |t|
      t.string :detalle

      t.timestamps
    end
  end

  def self.down
    drop_table :tipo_recibos
  end
end
