# == Schema Information
# Schema version: 20111013184648
#
# Table name: associated_document_types
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  company_id    :integer
#  created_at    :datetime
#  updated_at    :datetime
#  document_type :string(255)
#

class AssociatedDocumentType < ActiveRecord::Base
  has_many :attachment, :dependent => :restrict
  validates_presence_of		    :name, :document_type,                    :message => "es un dato requerido"

  #scope :by_company, lambda {|company| where(:company_id => company) }
  default_scope  ($MULTIPLE_COMPANIES == true) ? where(:company_id => $CURRENT_COMPANY) : where(false)

end
