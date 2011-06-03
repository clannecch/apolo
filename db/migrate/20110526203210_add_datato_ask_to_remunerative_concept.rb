class AddDatatoAskToRemunerativeConcept < ActiveRecord::Migration
  def self.up
    add_column :remunerative_concepts, :data_to_ask, :integer
  end

  def self.down
    remove_column :remunerative_concepts, :data_to_ask
  end
end
