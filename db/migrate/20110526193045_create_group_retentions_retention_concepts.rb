class CreateGroupRetentionsRetentionConcepts < ActiveRecord::Migration
  def self.up
    create_table :group_retentions_retention_concepts, :id => false do |t|
      t.integer :group_retention_id
      t.integer :retention_concept_id

      t.timestamps
    end
  end


  def self.down
    drop_table :group_remunerations_remunerative_concepts
  end
end

