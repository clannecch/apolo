class CompletarCamposDeviseToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :email, :string
    add_column :users, :encrypted_password, :string
    add_column :users, :current_sign_in_ip, :string
    add_column :users, :last_sign_in_ip, :string
    add_column :users, :sign_in_count, :integer
    add_column :users, :current_sign_in_at, :datetime
    add_column :users, :last_sign_in_at, :datetime
  end

  def self.down
    remove_column :users, :email
    remove_column :users, :encrypted_password
    remove_column :users, :current_sign_in_ip
    remove_column :users, :last_sign_in_ip
    remove_column :users, :sign_in_count
    remove_column :users, :current_sign_in_at
    remove_column :users, :last_sign_in_at
  end
end
