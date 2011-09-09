class AddNumberOfDecimalsToSicossFormat < ActiveRecord::Migration
  def self.up
    remove_column :sicoss_formats, :Number_of_decimals
    add_column :sicoss_formats, :number_of_decimals, :integer
  end

  def self.down
    remove_column :sicoss_formats, :number_of_decimals
    add_column :sicoss_formats, :Number_of_decimals, :integer
  end
end
