class AddConsortiumIdToEmployee < ActiveRecord::Migration
  def self.up
    add_column :employees, :consortium_id, :integer
  end

  def self.down
    remove_column :employees, :consortium_id
  end
end
