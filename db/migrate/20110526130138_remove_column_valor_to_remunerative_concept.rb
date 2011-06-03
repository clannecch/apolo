class RemoveColumnValorToRemunerativeConcept < ActiveRecord::Migration
  def self.up
    remove_column :remunerative_concepts, :valor
  end

  def self.down
    add_column :remunerative_concepts, :valor, :decimal
  end
end
