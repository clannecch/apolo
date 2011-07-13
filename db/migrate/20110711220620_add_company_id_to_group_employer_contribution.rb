class AddCompanyIdToGroupEmployerContribution < ActiveRecord::Migration
  def self.up
    add_column :group_employer_contributions, :company_id, :integer
  end

  def self.down
    remove_column :group_employer_contributions, :company_id
  end
end
