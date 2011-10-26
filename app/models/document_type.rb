# == Schema Information
# Schema version: 20111025214836
#
# Table name: document_types
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  company_id :integer
#  code       :string(255)
#  default    :boolean
#

class DocumentType < ActiveRecord::Base
  has_many :employee_familiar, :dependent => :restrict
	has_many :employee, :dependent => :restrict
	has_many :insurance_beneficiary, :dependent => :restrict
#  before_destroy :no_referenced_data

  #scope :by_company, lambda {|company| where(:company_id => company) }
  default_scope  ($MULTIPLE_COMPANIES == true) ? where(:company_id => $CURRENT_COMPANY) : where(false)

  validates_presence_of		    :detalle, :code,				            :message => "es un dato requerido"
  validates_uniqueness_of		  :code,			                        :message => "existente"
  validates_uniqueness_of     :default , :if => Proc.new { |t| t.default == true } , :message => "Ya existe un default"

  def no_referenced_data
    return if employee.empty?
    errors.add(:base, "Este Tipo de documento tiene "+employee.count.to_s+" referencias a Empleado")
    false
  end
end
