class AddReciboPrincipalToTipoRecibo < ActiveRecord::Migration
  def self.up
    add_column :tipo_recibos, :recibo_principal, :boolean
  end

  def self.down
    remove_column :tipo_recibos, :recibo_principal
  end
end
