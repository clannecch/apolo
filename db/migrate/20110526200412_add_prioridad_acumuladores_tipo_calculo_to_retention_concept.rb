class AddPrioridadAcumuladoresTipoCalculoToRetentionConcept < ActiveRecord::Migration
  def self.up
    add_column :retention_concepts, :prioridad, :integer
    add_column :retention_concepts, :formula_calculo_valor, :string
    add_column :retention_concepts, :acumuladores_valor, :string
    add_column :retention_concepts, :datos_a_pedir, :integer
  end

  def self.down
    remove_column :retention_concepts, :datos_a_pedir
    remove_column :retention_concepts, :acumuladores_valor
    remove_column :retention_concepts, :formula_calculo_valor
    remove_column :retention_concepts, :prioridad
  end
end
