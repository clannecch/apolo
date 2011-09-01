class AddParentescoKinshipToEmployeeFamilar < ActiveRecord::Migration
  def self.up
    add_column :employee_familiars, :kinship_id, :integer
  end

  def self.down
    remove_column :employee_familiars, :kinship_id
  end
end
