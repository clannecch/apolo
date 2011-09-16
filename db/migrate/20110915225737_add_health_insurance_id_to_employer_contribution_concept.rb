class AddHealthInsuranceIdToEmployerContributionConcept < ActiveRecord::Migration
  def self.up
    add_column :employer_contribution_concepts, :health_insurance_id, :integer
  end

  def self.down
    remove_column :employer_contribution_concepts, :health_insurance_id
  end
end
