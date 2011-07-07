class AddImageToEmployee < ActiveRecord::Migration
  def self.up
    add_column :employees, :foto, :blob
  end

  def self.down
    remove_column :employees, :foto
  end
end
