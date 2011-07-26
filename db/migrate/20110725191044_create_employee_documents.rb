class CreateEmployeeDocuments < ActiveRecord::Migration
  def self.up
    create_table :employee_documents do |t|
      t.integer :id_employee
      t.string :name
      t.string :document_file_name
      t.string :document_content_type
      t.datetime :document_updated_at
      t.integer :document_file_size

      t.timestamps
    end
  end

  def self.down
    drop_table :employee_documents
  end
end
