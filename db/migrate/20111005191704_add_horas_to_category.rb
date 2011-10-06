class AddHorasToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :horas, :decimal
    add_column :categories, :codigo, :string
  end

  def self.down
    remove_column :categories, :horas
    remove_column :categories, :codigo
  end
end
