class CambiarPeriodoMesToLiquidacion < ActiveRecord::Migration
  def self.up
    remove_column :liquidacions, :periodo_ano
    remove_column :liquidacions, :periodo_mes
    remove_column :liquidacions, :periodo_deposito_ano
    remove_column :liquidacions, :periodo_deposito_mes
    add_column :liquidacions, :periodo, :date
    add_column :liquidacions, :periodo_deposito, :date

  end

  def self.down
    add_column :liquidacions, :periodo_ano, :integer
    add_column :liquidacions, :periodo_mes, :integer
    add_column :liquidacions, :periodo_deposito_ano, :integer
    add_column :liquidacions, :periodo_deposito_mes, :integer
    remove_column :liquidacions, :periodo
    remove_column :liquidacions, :periodo_deposito
  end
end
