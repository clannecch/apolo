class AddAuxiliarToRemunerativeConcept < ActiveRecord::Migration
  def self.up
    add_column :remunerative_concepts, :auxiliar, :boolean
  end

  def self.down
    remove_column :remunerative_concepts, :auxiliar
  end
end
