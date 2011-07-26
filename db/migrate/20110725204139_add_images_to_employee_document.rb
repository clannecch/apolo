class AddImagesToEmployeeDocument < ActiveRecord::Migration
  def self.up
    add_column :employee_documents, :document_file, :longblob
    add_column :employee_documents, :document_thumb_file, :longblob
    add_column :employee_documents, :document_small_file, :longblob
  end

  def self.down
    remove_column :employee_documents, :document_small_file
    remove_column :employee_documents, :document_thumb_file
    remove_column :employee_documents, :document_file
  end
end
