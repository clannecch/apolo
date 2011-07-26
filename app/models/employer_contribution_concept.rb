# == Schema Information
# Schema version: 20110721162735
#
# Table name: employer_contribution_concepts
#
#  id                       :integer         not null, primary key
#  codigo                   :string(255)
#  detalle                  :string(255)
#  statistical_value        :integer
#  accounting_imputation_id :integer
#  created_at               :datetime
#  updated_at               :datetime
#  prioridad                :integer
#  acumuladores_valor       :string(255)
#  formula_calculo_valor    :string(255)
#  company_id               :integer
#

class EmployerContributionConcept < ActiveRecord::Base

  scope :by_company, lambda {|company| where(:company_id => company) }

  has_and_belongs_to_many :group_employer_contribution
  validates_presence_of		    :detalle,															                          :message => "es un dato requerido"
end

