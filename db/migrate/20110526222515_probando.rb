class Probando < ActiveRecord::Migration
  def self.up
    create_table :employer_contribution_concepts_group_employer_contributions, :id => false do |t|
      t.integer :group_employer_contribution_id
      t.integer :employer_contribution_concept_id

      t.timestamps
    end
  end


  def self.down
    drop_table :employer_contribution_concepts_group_employer_contributions
  end
end
