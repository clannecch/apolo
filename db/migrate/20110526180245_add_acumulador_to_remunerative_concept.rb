class AddAcumuladorToRemunerativeConcept < ActiveRecord::Migration
  def self.up
    add_column :remunerative_concepts, :acumuladores_valor, :decimal
    add_column :remunerative_concepts, :acumuladores_cantidad, :decimal
  end

  def self.down
    remove_column :remunerative_concepts, :acumuladores_cantidad
    remove_column :remunerative_concepts, :acumuladores_valor
  end
end
