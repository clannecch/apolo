class RemoveColumnTipoCalculoToRemunerativeConcept < ActiveRecord::Migration
  def self.up
    remove_column :remunerative_concepts, :calculation_type
  end

  def self.down
    add_column :remunerative_concepts, :calculation_type, :decimal
  end
end
