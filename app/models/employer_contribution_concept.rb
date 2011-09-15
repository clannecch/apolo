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
  belongs_to :employee
  belongs_to :accounting_imputation
  belongs_to :health_insurance
  belongs_to :retention_concept
  belongs_to :other_retention_concept, :foreign_key => "additional_health_insurance_id", :class_name => "RetentionConcept"

  validates_presence_of		    :codigo ,															:message => "es un dato requerido"
  validates_presence_of		    :detalle ,							  						:message => "es un dato requerido"
  validates_presence_of		    :prioridad ,													:message => "es un dato requerido"
  validates_presence_of		    :formula_calculo_valor ,							:message => "es un dato requerido"


  scope :by_company, lambda {|company| where(:company_id => company) }

  has_and_belongs_to_many :group_employer_contribution
  validates_presence_of		    :detalle,															                          :message => "es un dato requerido"
end

