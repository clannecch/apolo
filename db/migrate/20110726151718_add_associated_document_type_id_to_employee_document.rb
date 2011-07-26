class AddAssociatedDocumentTypeIdToEmployeeDocument < ActiveRecord::Migration
  def self.up
    add_column :employee_documents, :associated_document_type_id, :integer
  end

  def self.down
    remove_column :employee_documents, :associated_document_type_id
  end
end
