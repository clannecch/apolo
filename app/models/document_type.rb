# == Schema Information
# Schema version: 20110721162735
#
# Table name: document_types
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  company_id :integer
#

class DocumentType < ActiveRecord::Base
  has_many :employee_familiar, :dependent => :restrict
	has_many :employee, :dependent => :restrict
	has_many :insurance_beneficiary, :dependent => :restrict
#  before_destroy :no_referenced_data
  validates_presence_of		    :detalle,															                :message => "es un dato requerido"

  scope :by_company, lambda {|company| where(:company_id => company) }
  def no_referenced_data
    return if employee.empty?
    errors.add(:base, "Este Tipo de documento tiene "+employee.count.to_s+" referencias a Empleado")
    false
  end
end
