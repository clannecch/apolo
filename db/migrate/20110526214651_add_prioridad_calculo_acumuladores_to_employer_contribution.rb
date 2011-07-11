class AddPrioridadCalculoAcumuladoresToEmployerContribution < ActiveRecord::Migration
  def self.up
    add_column :employer_contributions, :prioridad, :integer
    add_column :employer_contributions, :acumuladores_valor, :string
    add_column :employer_contributions, :formula_calculo_valor, :string
  end

  def self.down
    remove_column :employer_contributions, :formula_calculo_valor
    remove_column :employer_contributions, :acumuladores_valor
    remove_column :employer_contributions, :prioridad
  end
end
