class RemovePidedatosToRemunerativeConcept < ActiveRecord::Migration
  def self.up
    remove_column :remunerative_concepts, :pide_datos
  end

  def self.down
    add_column :remunerative_concepts, :pide_datos, :integer
  end
end
