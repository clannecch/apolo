class AddAfipToEmployee < ActiveRecord::Migration

  def self.up
    add_column :employees, :sicoss_reduccion, :string
    add_column :employees, :sicoss_employer_type_id, :integer
    add_column :employees, :sicoss_situation_id, :integer
    add_column :employees, :sicoss_condition_id, :integer
    add_column :employees, :sicoss_activity_id, :integer
    add_column :employees, :sicoss_contract_mode_id, :integer
    add_column :employees, :sicoss_damaged_id, :integer
    add_column :employees, :sicoss_location_id, :integer
    add_column :employees, :sicoss_reduction_zone_id, :integer
    add_column :employees, :sicoss_en_convenio, :string
    add_column :employees, :siscos_seguro_obligatorio, :character
    add_column :employees, :sicoss_regimen_type_id, :integer
  end

  def self.down
    remove_column :employees, :sicoss_regimen_type_id
    remove_column :employees, :sicoss_seguro_obligatorio
    remove_column :employees, :sicoss_en_convenio
    remove_column :employees, :sicoss_reduction_zone_id
    remove_column :employees, :sicoss_location_id
    remove_column :employees, :sicoss_damaged_id
    remove_column :employees, :sicoss_contract_mode_id
    remove_column :employees, :sicoss_activity_id
    remove_column :employees, :sicoss_condition_id
    remove_column :employees, :sicoss_situation_id
    remove_column :employees, :sicoss_employer_type_id
    remove_column :employees, :sicoss_reduccion
  end

end
