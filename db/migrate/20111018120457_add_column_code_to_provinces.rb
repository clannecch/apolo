class AddColumnCodeToProvinces < ActiveRecord::Migration
  def self.up
    add_column :provinces, :code, :string
  end

  def self.down
    remove_column :provinces, :code
  end
end
