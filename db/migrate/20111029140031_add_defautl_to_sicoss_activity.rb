class AddDefautlToSicossActivity < ActiveRecord::Migration
  def self.up
    add_column :sicoss_activities, :default, :boolean
    add_column :sicoss_conditions, :default, :boolean
  end

  def self.down
    remove_column :sicoss_activities, :default
    remove_column :sicoss_conditions, :default
  end
end
