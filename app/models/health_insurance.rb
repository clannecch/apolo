# == Schema Information
# Schema version: 20111013184648
#
# Table name: health_insurances
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  company_id :integer
#  code       :string(255)
#

class HealthInsurance < ActiveRecord::Base
  #scope :by_company, lambda {|company| where(:company_id => company) }
  default_scope  ($MULTIPLE_COMPANIES == true) ? where(:company_id => $CURRENT_COMPANY) : where(false)

  has_many :employees, :dependent => :restrict
	has_many :employee_familiars, :dependent => :restrict
  validates_presence_of		    :detalle,									 :message => "es un dato requerido"
end
