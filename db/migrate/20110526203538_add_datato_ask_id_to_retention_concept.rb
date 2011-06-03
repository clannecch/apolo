class AddDatatoAskIdToRetentionConcept < ActiveRecord::Migration
  def self.up
    add_column :retention_concepts, :data_to_ask_id, :integer
  end

  def self.down
    remove_column :retention_concepts, :data_to_ask_id
  end
end
