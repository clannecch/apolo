class AddPrioridadCalculoAcumuladoresToEmployerContributionConcept < ActiveRecord::Migration
  def self.up
    add_column :employer_contribution_concepts, :prioridad, :integer
    add_column :employer_contribution_concepts, :acumuladores_valor, :string
    add_column :employer_contribution_concepts, :formula_calculo_valor, :string
  end

  def self.down
    remove_column :employer_contribution_concepts, :formula_calculo_valor
    remove_column :employer_contribution_concepts, :acumuladores_valor
    remove_column :employer_contribution_concepts, :prioridad
  end
end
