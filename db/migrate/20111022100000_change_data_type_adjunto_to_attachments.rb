class ChangeDataTypeAdjuntoToAttachments < ActiveRecord::Migration
  def self.up
    remove_column :attachments, :adjunto_file
  end

  def self.down
    remove_column :attachments, :adjunto_file
  end
end
