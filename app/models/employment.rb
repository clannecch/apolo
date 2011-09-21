# == Schema Information
# Schema version: 20110721162735
#
# Table name: employments
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  company_id :integer
#

class Employment < ActiveRecord::Base
  scope :by_company, lambda {|company| where(:company_id => company) }

	has_many :employees, :dependent => :restrict
  validates_presence_of		    :detalle,															                          :message => "es un dato requerido"

end
