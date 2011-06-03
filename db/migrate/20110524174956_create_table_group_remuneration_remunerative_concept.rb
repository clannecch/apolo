class CreateTableGroupRemunerationRemunerativeConcept < ActiveRecord::Migration
  def self.up
       create_table :group_remunerations_remunerative_concepts, :id => false do |t|
      t.integer :group_remuneration_id
      t.integer :remunerative_concept_id

      t.timestamps
    end
  end

  def self.down
    drop_table :group_remunerations_remunerative_concepts
  end
end

