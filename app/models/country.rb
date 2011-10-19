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
  has_many :provinces, :class_name => "province"
  
  validates_presence_of		    :detalle, :message => "es un dato requerido"
  #belongs_to :company

  #scope :by_company, lambda {|company| where(:company_id => company) }
  default_scope  ($MULTIPLE_COMPANIES == true) ? where(:company_id => $CURRENT_COMPANY) : where(false)
end
