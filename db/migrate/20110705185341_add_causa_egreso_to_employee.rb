class AddCausaEgresoToEmployee < ActiveRecord::Migration
  def self.up
    add_column :employees, :causa_egreso_id, :integer
  end

  def self.down
    remove_column :employees, :causa_egreso_id
  end
end
