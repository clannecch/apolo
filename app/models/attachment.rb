# == Schema Information
# Schema version: 20110910142220
#
# Table name: attachments
#
#  id                          :integer         not null, primary key
#  attachable_id               :integer
#  attachable_type             :string(255)
#  associated_document_type_id :integer
#  name                        :string(255)
#  reception_date              :date
#  adjunto_file_name           :string(255)
#  adjunto_content_type        :string(255)
#  associated_document_type    :integer
#  created_at                  :datetime
#  updated_at                  :datetime
#  adjunto_file                :binary
#

class Attachment < ActiveRecord::Base
  has_attached_file :adjunto,
                    :storage => :database
  belongs_to :associated_document_type
  belongs_to :attachable, :polymorphic => true
  default_scope select_without_file_columns_for(:adjunto)
#  validates_attachment_size :adjunto, :less_than => 2.megabytes
  validates_attachment_presence :adjunto
=begin
  validates_attachment_content_type :adjunto, :less_than => 1.megabytes,
                        :content_type => ['image/jpeg', 'image/jpg', 'application/zip',
                                          'application/xls', 'application/xlsx', 'application/pdf'],
                        :message => 'Solo permite JPG /JPEG / ZIP / PDF / XLS / XLSX'
=end
end

#Attachment.all.each {|a| link_to("Ver el #{a.attachable.class}", a.attachable)}


#=> ['text/csv','text/comma-separated-values','text/csv','application/csv','application/excel','application/vnd.ms-excel','application/vnd.msexcel','text/anytext','text/plain']