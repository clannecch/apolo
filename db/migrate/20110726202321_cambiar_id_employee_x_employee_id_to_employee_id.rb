class CambiarIdEmployeeXEmployeeIdToEmployeeId < ActiveRecord::Migration
  def self.up
    add_column :employee_documents, :employee_id, :integer
    remove_column :employee_documents, :id_employee
  end

  def self.down
    add_column :employee_documents, :id_employee, :integer
    remove_column :employee_documents, :employee_id
  end
end
