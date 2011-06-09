class CambiarTipoPorType < ActiveRecord::Migration
    def self.up
      rename_column :detalle_recibos, :_tipo, :_type
    end
end
