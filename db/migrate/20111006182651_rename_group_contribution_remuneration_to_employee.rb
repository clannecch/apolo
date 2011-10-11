class RenameGroupContributionRemunerationToEmployee < ActiveRecord::Migration
  def self.up
=begin
    remove_column :employees, :group_employercontribution_id
    remove_column :employees, :group_renuneration_id
    add_column :employees, :group_employer_contribution_id, :integer
    add_column :employees, :group_remuneration_id, :integer
=end
  end

  def self.down
=begin
    add_column :employees, :group_employercontribution_id
    add_column :employees, :group_renuneration_id
    remove_column :employees, :group_employer_contribution_id, :integer
    remove_column :employees, :group_remuneration_id, :integer
=end
  end
end
