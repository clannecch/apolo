class AddCantidadEnReciboToRemunerativeConcept < ActiveRecord::Migration
  def self.up
    add_column :remunerative_concepts, :cantidad_en_recibo, :string
  end

  def self.down
    remove_column :remunerative_concepts, :cantidad_en_recibo
  end
end
