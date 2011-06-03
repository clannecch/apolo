class AddDatatoAskIdToRemunerativeConcept < ActiveRecord::Migration
  def self.up
    add_column :remunerative_concepts, :data_to_ask_id, :integer
  end

  def self.down
    remove_column :remunerative_concepts, :data_to_ask_id
  end
end
