class AddDetalleToEmployeeRemunerativeConcept < ActiveRecord::Migration
  def self.up
    add_column :employee_remunerative_concepts, :detalle, :text
  end

  def self.down
    remove_column :employee_remunerative_concepts, :detalle
  end
end
