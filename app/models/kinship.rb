# == Schema Information
# Schema version: 20111024224627
#
# Table name: kinships
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  hijo_conyugue :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  code          :string(255)
#

class Kinship < ActiveRecord::Base
  has_many :employee_familiars, :dependent => :restrict
	has_many :insurance_beneficiaries, :dependent => :restrict

  #scope :by_company, lambda {|company| where(:company_id => company) }
  default_scope  ($MULTIPLE_COMPANIES == true) ? where(:company_id => $CURRENT_COMPANY) : where(false)

  validates_presence_of		    :name, :code,												:message => "es un dato requerido"
  validates_uniqueness_of		  :code,			                        :message => "existente"
end
