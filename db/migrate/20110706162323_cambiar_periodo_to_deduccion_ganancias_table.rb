class CambiarPeriodoToDeduccionGananciasTable < ActiveRecord::Migration
  def self.up
    remove_column :deduccion_ganancias_tables, :periodo
    add_column :deduccion_ganancias_tables, :periodo_ano, :integer
    add_column :deduccion_ganancias_tables, :periodo_mes, :integer
  end

  def self.down
    add_column    :deduccion_ganancias_tables, :periodo, :string
    remove_column :deduccion_ganancias_tables, :periodo_ano
    remove_column :deduccion_ganancias_tables, :periodo_mes
  end
end
