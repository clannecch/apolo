# == Schema Information
# Schema version: 20110513210029
#
# Table name: marital_statuses
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class MaritalStatus < ActiveRecord::Base
  scope :by_company, lambda {|company| where(:company_id => company) }
	has_many :employees
  validates_presence_of		    :detalle,															                          :message => "es un dato requerido"
end
