class AddTipoToRemunerationType < ActiveRecord::Migration
  def self.up
    add_column :remuneration_types, :hora_dia_mes, :string
  end

  def self.down
    remove_column :remuneration_types, :hora_dia_mes
  end
end
