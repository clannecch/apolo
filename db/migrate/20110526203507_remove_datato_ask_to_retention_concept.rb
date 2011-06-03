class RemoveDatatoAskToRetentionConcept < ActiveRecord::Migration
  def self.up
    remove_column :retention_concepts, :data_to_ask
  end

  def self.down
    add_column :retention_concepts, :data_to_ask, :integer
  end
end
