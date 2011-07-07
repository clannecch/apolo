class CreateEmployeeRetentionConcepts < ActiveRecord::Migration
  def self.up
    create_table :employee_retention_concepts do |t|
      t.integer :employee_id
      t.integer :retention_concept_id
      t.integer :cantidad
      t.float :importe
      t.date :fecha_inicio
      t.date :fecha_final

      t.timestamps
    end
  end

  def self.down
    drop_table :employee_retention_concepts
  end
end
