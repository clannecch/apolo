# == Schema Information
# Schema version: 20110910142220
#
# Table name: associated_document_types
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#

class AssociatedDocumentType < ActiveRecord::Base
  has_many :attachment, :dependent => :restrict
  validates_presence_of		    :name,						                          :message => "es un dato requerido"

  scope :by_company, lambda {|company| where(:company_id => company) }
end
