class AddModifiableToSicossFormat < ActiveRecord::Migration
  def self.up
    add_column :sicoss_formats, :modifiable, :boolean
  end

  def self.down
    remove_column :sicoss_formats, :modifiable
  end
end
