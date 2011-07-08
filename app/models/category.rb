# == Schema Information
# Schema version: 20110621182933
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  importe    :decimal(, )
#

class Category < ActiveRecord::Base
	has_many :employees
  validates_presence_of		    :detalle,															              :message => "es un dato requerido"

  scope :by_company, lambda {|company| where(:company_id => company) }

end
