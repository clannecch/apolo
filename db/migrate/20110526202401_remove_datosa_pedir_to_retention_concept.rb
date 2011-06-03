class RemoveDatosaPedirToRetentionConcept < ActiveRecord::Migration
  def self.up
    remove_column :retention_concepts, :datos_a_pedir
  end

  def self.down
    add_column :retention_concepts, :datos_a_pedir, :integer
  end
end
