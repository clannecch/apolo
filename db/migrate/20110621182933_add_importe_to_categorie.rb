class AddImporteToCategorie < ActiveRecord::Migration
  def self.up
    add_column :categories, :importe, :decimal
  end

  def self.down
    remove_column :categories, :importe
  end
end
