class RemoveColumnAcumuladoresToRemunerativeConcept < ActiveRecord::Migration
  def self.up
    remove_column :remunerative_concepts, :acumuladores_valor
    remove_column :remunerative_concepts, :acumuladores_cantidad
  end

  def self.down
    add_column :remunerative_concepts, :acumuladores_cantidad, :decimal
    add_column :remunerative_concepts, :acumuladores_valor, :decimal
  end
end
