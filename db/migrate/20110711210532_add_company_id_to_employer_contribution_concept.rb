class AddCompanyIdToEmployerContributionConcept < ActiveRecord::Migration
  def self.up
    add_column :employer_contribution_concepts, :company_id, :integer
  end

  def self.down
    remove_column :employer_contribution_concepts, :company_id
  end
end
