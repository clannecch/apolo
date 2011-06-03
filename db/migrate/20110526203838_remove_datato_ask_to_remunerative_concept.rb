class RemoveDatatoAskToRemunerativeConcept < ActiveRecord::Migration
  def self.up
    remove_column :remunerative_concepts, :data_to_ask
  end

  def self.down
    add_column :remunerative_concepts, :data_to_ask, :integer
  end
end
