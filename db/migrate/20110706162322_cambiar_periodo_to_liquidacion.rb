class CambiarPeriodoToLiquidacion < ActiveRecord::Migration
  def self.up
    remove_column :liquidacions, :periodo
    remove_column :liquidacions, :periodo_deposito
    add_column :liquidacions, :periodo_ano, :integer
    add_column :liquidacions, :periodo_mes, :integer
    add_column :liquidacions, :periodo_deposito_ano, :integer
    add_column :liquidacions, :periodo_deposito_mes, :integer
  end

  def self.down
    add_column    :liquidacions, :periodo, :string
    add_column    :liquidacions, :periodo_deposito, :string
    remove_column :liquidacions, :periodo_ano
    remove_column :liquidacions, :periodo_mes
    remove_column :liquidacions, :periodo_deposito_ano
    remove_column :liquidacions, :periodo_deposito_mes
  end
end
