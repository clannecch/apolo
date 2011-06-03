class RemoveColumnBaseDeCalculoToRemunerativeConcept < ActiveRecord::Migration
  def self.up
    remove_column :remunerative_concepts, :base_calculo
    remove_column :remunerative_concepts, :acumulador_cantidad
  end

  def self.down
    add_column :remunerative_concepts, :acumulador_cantidad, :string
    add_column :remunerative_concepts, :base_calculo, :string
  end
end
