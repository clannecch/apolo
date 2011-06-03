class AddAcumuladorStringToRemunerativeConcept < ActiveRecord::Migration
  def self.up
    add_column :remunerative_concepts, :acumuladores_valor, :string
    add_column :remunerative_concepts, :acumuladores_cantidad, :string
  end

  def self.down
    remove_column :remunerative_concepts, :acumuladores_cantidad
    remove_column :remunerative_concepts, :acumuladores_valor
  end
end
