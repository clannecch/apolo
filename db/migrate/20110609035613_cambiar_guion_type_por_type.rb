class CambiarGuionTypePorType < ActiveRecord::Migration
  def self.up
    rename_column :detalle_recibos, :_type, :type
  end
end
