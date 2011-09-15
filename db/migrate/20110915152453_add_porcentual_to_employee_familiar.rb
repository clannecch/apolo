class AddPorcentualToEmployeeFamiliar < ActiveRecord::Migration
  def self.up
    add_column :employee_familiars, :porcentual, :string
  end

  def self.down
    remove_column :employee_familiars, :porcentual
  end
end
