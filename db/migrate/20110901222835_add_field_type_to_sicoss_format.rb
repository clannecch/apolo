class AddFieldTypeToSicossFormat < ActiveRecord::Migration
  def self.up
    add_column :sicoss_formats, :field_type, :string
  end

  def self.down
    remove_column :sicoss_formats, :field_type
  end
end
