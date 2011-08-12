# == Schema Information
# Schema version: 20110721162735
#
# Table name: educational_levels
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  company_id :integer
#

class EducationalLevel < ActiveRecord::Base

	has_many :employees
  validates_presence_of		    :detalle,															                          :message => "es un dato requerido"

  scope :by_company, lambda {|company| where(:company_id => company) }
end
