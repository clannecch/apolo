# == Schema Information
# Schema version: 20110513210029
#
# Table name: document_types
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class DocumentType < ActiveRecord::Base
	has_many :employee
	has_many :insurance_beneficiary
	has_many :employee_familiar
  validates_presence_of		    :detalle,															                :message => "es un dato requerido"

  scope :by_company, lambda {|company| where(:company_id => company) }

end
