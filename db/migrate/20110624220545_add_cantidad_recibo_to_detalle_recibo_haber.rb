class AddCantidadReciboToDetalleReciboHaber < ActiveRecord::Migration
  def self.up
    add_column :detalle_recibo_habers, :cantidad_recibo, :decimal
  end

  def self.down
    remove_column :detalle_recibo_habers, :cantidad_recibo
  end
end
