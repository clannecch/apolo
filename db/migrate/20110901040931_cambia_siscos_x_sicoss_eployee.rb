class CambiaSiscosXSicossEployee < ActiveRecord::Migration

  def self.up
    remove_column :employees, :siscos_seguro_obligatorio
    add_column :employees, :sicoss_seguro_obligatorio, :character
  end

  def self.down
    remove_column :employees, :sicoss_seguro_obligatorio
    add_column :employees, :siscos_seguro_obligatorio, :character
  end

end
