class AddColumnEmailToUsers < ActiveRecord::Migration
  def self.up
    remove_column :users, :email
    #add_column :users, :email, :string
  end

  def self.down
    #remove_column :users, :email
    add_column :users, :email, :string
  end
end
