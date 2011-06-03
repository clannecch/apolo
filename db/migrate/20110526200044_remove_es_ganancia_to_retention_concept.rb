class RemoveEsGananciaToRetentionConcept < ActiveRecord::Migration
  def self.up
    remove_column :retention_concepts, :es_ganancia
  end

  def self.down
    add_column :retention_concepts, :es_ganancia, :boolean
  end
end
