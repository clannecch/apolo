# == Schema Information
# Schema version: 20110513210029
#
# Table name: insurance_companies
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class InsuranceCompany < ActiveRecord::Base
	has_many :employees
  validates_presence_of		    :detalle,															                          :message => "es un dato requerido"
end
