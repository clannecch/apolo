class AddDatatoAskToRetentionConcept < ActiveRecord::Migration
  def self.up
    add_column :retention_concepts, :data_to_ask, :integer
  end

  def self.down
    remove_column :retention_concepts, :data_to_ask
  end
end
