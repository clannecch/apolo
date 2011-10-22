class AddColumnGroupEmployerContributionIdToEmployees < ActiveRecord::Migration
  def self.up
    add_column :employees, :group_employer_contribution_id, :integer
  end

  def self.down
    remove_column :employees, :group_employer_contribution_id
  end
end
