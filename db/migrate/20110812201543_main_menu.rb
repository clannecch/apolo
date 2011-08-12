class MainMenu < ActiveRecord::Migration
  def self.up
    create_table :authorizations, :force => true do |t|
      t.string  :code,                      :limit => 16,                      :null => false
      t.string  :name,                      :limit => 128,                     :null => false
      t .timestamps
    end

    create_table :menus, :force => true do |t|
      t.integer :parent_id
      t.string  :name,                      :limit => 128,                     :null => false
      t.string  :link_url,                  :limit => 128,                     :null => true
      t.integer :order_no
      t.timestamps
    end

    create_table :menu_roles, :force => true do |t|
      t.integer :menu_id,                                                      :null => false
      t.integer :rol_id,                                                       :null => false
      t.timestamps
    end

    create_table :menu_users, :force => true do |t|
      t.integer :menu_id,                                                      :null => false
      t.integer :user_id,                                                      :null => false
      t.timestamps
    end

    create_table :user_authorizations, :force => true do |t|
      t.integer   :user_id,                                                    :null => false
      t.integer   :authorization_id,                                           :null => false
      t.timestamps
    end

    create_table :user_roles, :force => true do |t|
      t.integer :user_id,                                                      :null => false
      t.integer :rol_id,                                                       :null => false
      t.boolean :is_active,                                                    :null => true,      :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :authorizations
    drop_table :menus
    drop_table :menu_roles
    drop_table :menu_users
    drop_table :user_authorizations
    drop_table :user_roles
  end
end
