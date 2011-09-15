class AddAddressToEmployeeFamiliar < ActiveRecord::Migration
  def self.up
    add_column :employee_familiars, :address, :string
  end

  def self.down
    remove_column :employee_familiars, :address
  end
end
