class AddCodeToTablesAfip < ActiveRecord::Migration
  def self.up
    add_column :sicoss_situations, :code, :string
    add_column :sicoss_conditions, :code, :string
    add_column :sicoss_activities, :code, :string
    add_column :sicoss_contract_modes, :code, :string
    add_column :sicoss_damageds, :code, :string
    add_column :sicoss_locations, :code, :string
    add_column :sicoss_reduction_zones, :code, :string
    add_column :sicoss_regimen_types, :code, :string


  end

  def self.down
    remove_column :sicoss_situations, :code
    remove_column :sicoss_conditions, :code
    remove_column :sicoss_activities, :code
    remove_column :sicoss_contract_modes, :code
    remove_column :sicoss_damageds , :code
    remove_column :sicoss_reduction_zones, :code
    remove_column :sicoss_regimen_types, :code
  end
end
