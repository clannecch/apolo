class AddRetentionConceptIdAditionalHealthInsuranceIdToEmployerContributionConcept < ActiveRecord::Migration
  def self.up
    add_column :employer_contribution_concepts, :retention_concept_id, :integer
    add_column :employer_contribution_concepts, :additional_health_insurance_id, :integer
  end

  def self.down
    remove_column :employer_contribution_concepts, :additional_heath_insurance_id
  remove_column :employer_contribution_concepts, :retention_concept_id
  end
end
