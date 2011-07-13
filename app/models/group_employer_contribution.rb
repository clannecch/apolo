# == Schema Information
# Schema version: 20110513210029
#
# Table name: group_employer_contributions
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class GroupEmployerContribution < ActiveRecord::Base
  scope :by_company, lambda {|company| where(:company_id => company) }

	has_many :employees
  has_and_belongs_to_many :employer_contribution_concepts
  validates_presence_of		    :detalle,															                          :message => "es un dato requerido"
end
