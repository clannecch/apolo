class CambiarPeriodoMesToLiquidacion < ActiveRecord::Migration
  def self.up
    remove_column :liquidacions, :periodo_ano
    remove_column :liquidacions, :periodo_mes
    remove_column :liquidacions, :periodo_deposito_ano
    remove_column :liquidacions, :periodo_deposito_mes
  end

  def self.down
    add_column :liquidacions, :periodo_ano, :integer
    add_column :liquidacions, :periodo_mes, :integer
    add_column :liquidacions, :periodo_deposito_ano, :integer
    add_column :liquidacions, :periodo_deposito_mes, :integer
  end
end
