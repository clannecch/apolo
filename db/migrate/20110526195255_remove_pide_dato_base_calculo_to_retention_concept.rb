class RemovePideDatoBaseCalculoToRetentionConcept < ActiveRecord::Migration
  def self.up
    remove_column :retention_concepts, :base_calculo
    remove_column :retention_concepts, :pide_datos
    remove_column :retention_concepts, :calculation_type
    remove_column :retention_concepts, :valor
    remove_column :retention_concepts, :grupo_ganancias
    remove_column :retention_concepts, :es_auxiliar_ganancias
  end

  def self.down
    add_column :retention_concepts, :es_auxiliar_ganancias, :boolean
    add_column :retention_concepts, :grupo_ganancias, :string
    add_column :retention_concepts, :valor, :decimal
    add_column :retention_concepts, :calculation_type, :integer
    add_column :retention_concepts, :pide_datos, :boolean
    add_column :retention_concepts, :base_calculo, :string
  end
end
