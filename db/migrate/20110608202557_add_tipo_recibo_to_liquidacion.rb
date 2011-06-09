class AddTipoReciboToLiquidacion < ActiveRecord::Migration
  def self.up
    add_column :liquidacions, :tipo_recibo_id, :integer
  end

  def self.down
    remove_column :liquidacions, :tipo_recibo_id
  end
end
