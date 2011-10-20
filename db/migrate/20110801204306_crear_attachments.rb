class CrearAttachments < ActiveRecord::Migration
  def self.up
    create_table :attachments do |t|
      t.integer :attachable_id
      t.string :attachable_type
      t.integer :associated_document_type_id
      t.string :name
      t.date :reception_date
      t.string :adjunto_file_name
      t.string :adjunto_content_type
      t.integer :associated_document_type
      t.timestamps
    end
    execute 'ALTER TABLE attachments ADD COLUMN  adjunto_file oid'
  end

  def self.down
    drop_table :attachments
  end
end
