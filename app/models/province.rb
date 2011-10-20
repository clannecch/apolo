# == Schema Information
# Schema version: 20110721162735
#
# Table name: provinces
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  company_id :integer
#

class Province < ActiveRecord::Base
  belongs_to :country, :class_name => "Country", :foreign_key => "country_id"
  
  #scope :by_company, lambda {|company| where(:company_id => company) }
  default_scope  ($MULTIPLE_COMPANIES == true) ? where(:company_id => $CURRENT_COMPANY) : where(false)

  has_many :employees, :dependent => :restrict
  has_many :employee_familiars , :dependent => :restrict
  validates_presence_of		    :detalle,									:message => "es un dato requerido"
end
