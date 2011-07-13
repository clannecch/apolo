# == Schema Information
# Schema version: 20110513210029
#
# Table name: health_insurances
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class HealthInsurance < ActiveRecord::Base
  scope :by_company, lambda {|company| where(:company_id => company) }
	has_many :employees
	has_many :employee_familiars
  validates_presence_of		    :detalle,															                          :message => "es un dato requerido"
end
