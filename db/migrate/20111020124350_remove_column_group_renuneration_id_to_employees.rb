class RemoveColumnGroupRenunerationIdToEmployees < ActiveRecord::Migration
  def self.up
    remove_column :employees, :group_renuneration_id
  end

  def self.down
    add_column :employees, :group_renuneration_id, :integer
  end
end
