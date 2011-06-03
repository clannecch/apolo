class RemoveDatosaPedirToRemunerativeConcept < ActiveRecord::Migration
  def self.up
    remove_column :remunerative_concepts, :datos_a_pedir
  end

  def self.down
    add_column :remunerative_concepts, :datos_a_pedir, :integer
  end
end
