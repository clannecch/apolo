class AddColumnGroupRemunerationIdToEmployees < ActiveRecord::Migration
  def self.up
    add_column :employees, :group_remuneration_id, :integer
  end

  def self.down
    remove_column :employees, :group_remuneration_id
#    add_column :employees, :group_remuneration_id, :integer
  end
end
