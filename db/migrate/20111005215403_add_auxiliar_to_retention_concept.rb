class AddAuxiliarToRetentionConcept < ActiveRecord::Migration
  def self.up
    add_column :retention_concepts, :auxiliar, :boolean
  end

  def self.down
    remove_column :retention_concepts, :auxiliar
  end
end
