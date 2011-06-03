class AddCalculosToRemunerativeConcept < ActiveRecord::Migration
  def self.up
    add_column :remunerative_concepts, :calculo_valor, :string
    add_column :remunerative_concepts, :calculo_cantidad, :string
  end

  def self.down
    remove_column :remunerative_concepts, :calculo_cantidad
    remove_column :remunerative_concepts, :calculo_valor
  end
end
