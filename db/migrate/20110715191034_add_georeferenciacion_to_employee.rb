class AddGeoreferenciacionToEmployee < ActiveRecord::Migration
  def self.up
    add_column :employees, :latitude, :float
    add_column :employees, :longitude, :float
  end

  def self.down
    remove_column :employees, :longitude
    remove_column :employees, :latitude
  end
end
