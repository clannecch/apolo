class ChangeDataTypeAdjuntoToAttachments < ActiveRecord::Migration
  def self.up
    remove_column :attachments, :adjunto_file
    add_column :attachments, :adjunto_file, :bytea
  end

  def self.down
#    remove_column :attachments, :adjunto_file
    add_column :attachments, :adjunto_file, :bytea
  end
end
