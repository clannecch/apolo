class AddDetalleToEmployeeRetentionConcept < ActiveRecord::Migration
  def self.up
    add_column :employee_retention_concepts, :detalle, :text
  end

  def self.down
    remove_column :employee_retention_concepts, :detalle
  end
end
