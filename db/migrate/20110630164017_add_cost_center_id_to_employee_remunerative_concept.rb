class AddCostCenterIdToEmployeeRemunerativeConcept < ActiveRecord::Migration
  def self.up
    add_column :employee_remunerative_concepts, :cost_center_id, :integer
  end

  def self.down
    remove_column :employee_remunerative_concepts, :cost_center_id
  end
end
