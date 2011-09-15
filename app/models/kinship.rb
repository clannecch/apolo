# == Schema Information
# Schema version: 20110914031047
#
# Table name: kinships
#
#  id            :integer         not null, primary key
#  name          :string(255)
#  hijo_conyugue :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  company_id    :integer
#

class Kinship < ActiveRecord::Base
  scope :by_company, lambda {|company| where(:company_id => company) }
	has_many :employees
  validates_presence_of		    :name,															                          :message => "es un dato requerido"
end
