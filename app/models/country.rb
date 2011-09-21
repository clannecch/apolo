# == Schema Information
# Schema version: 20110721162735
#
# Table name: countries
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  company_id :integer
#

class Country < ActiveRecord::Base
  has_many :employees, :dependent => :restrict
  validates_presence_of		    :detalle, :message => "es un dato requerido"
  #belongs_to :company

  scope :by_company, lambda {|company| where(:company_id => company) }

end
