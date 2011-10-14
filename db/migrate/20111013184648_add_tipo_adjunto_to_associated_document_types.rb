class AddTipoAdjuntoToAssociatedDocumentTypes < ActiveRecord::Migration
  def self.up
    add_column :associated_document_types, :document_type, :string
  end

  def self.down
    remove_column :associated_document_types, :document_type
  end
end
