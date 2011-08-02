class Attachment < ActiveRecord::Base
  has_attached_file :adjunto,
                    :storage => :database
  belongs_to :associated_document_type
  belongs_to :attachable, :polymorphic => true
  default_scope select_without_file_columns_for(:adjunto)
#  validates_attachment_size :adjunto, :less_than => 2.megabytes
  validates_attachment_presence :adjunto
  validates_attachment_content_type :adjunto,
                        :content_type => ['image/jpeg', 'image/jpg', 'application/zip',
                                          'application/xls', 'application/xlsx', 'application/pdf'],
                        :message => 'Solo permite JPG /JPEG / ZIP / PDF'

end

#Attachment.all.each {|a| link_to("Ver el #{a.attachable.class}", a.attachable)}


