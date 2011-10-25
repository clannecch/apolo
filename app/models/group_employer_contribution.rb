# == Schema Information
# Schema version: 20111024224627
#
# Table name: group_employer_contributions
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  company_id :integer
#  code       :string(255)
#

class GroupEmployerContribution < ActiveRecord::Base

  #scope :by_company, lambda {|company| where(:company_id => company) }
  default_scope  ($MULTIPLE_COMPANIES == true) ? where(:company_id => $CURRENT_COMPANY) : where(false)

	has_many :employees, :dependent => :restrict
  has_and_belongs_to_many :employer_contribution_concepts
  validates_presence_of		    :detalle,:code,                     :message => "es un dato requerido"
  validates_uniqueness_of		  :code,			                        :message => "existente"

end
