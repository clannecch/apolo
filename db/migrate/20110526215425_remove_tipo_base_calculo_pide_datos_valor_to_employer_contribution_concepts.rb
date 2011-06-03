class RemoveTipoBaseCalculoPideDatosValorToEmployerContributionConcepts < ActiveRecord::Migration
  def self.up
    remove_column :employer_contribution_concepts, :calculation_type
    remove_column :employer_contribution_concepts, :base_calculo
    remove_column :employer_contribution_concepts, :valor
    remove_column :employer_contribution_concepts, :pide_datos
  end

  def self.down
    add_column :employer_contribution_concepts, :pide_datos, :boolean
    add_column :employer_contribution_concepts, :valor, :decimal
    add_column :employer_contribution_concepts, :base_calculo, :string
    add_column :employer_contribution_concepts, :calculation_type, :integer
  end
end
