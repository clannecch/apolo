# == Schema Information
# Schema version: 20110621182933
#
# Table name: retention_concepts
#
#  id                       :integer         not null, primary key
#  codigo                   :string(255)
#  detalle                  :string(255)
#  statistical_value        :integer
#  accounting_imputation_id :integer
#  created_at               :datetime
#  updated_at               :datetime
#  prioridad                :integer
#  formula_calculo_valor    :string(255)
#  acumuladores_valor       :string(255)
#  data_to_ask_id           :integer
#

class RetentionConcept < ActiveRecord::Base
  scope :by_company, lambda {|company| where(:company_id => company) }
  has_and_belongs_to_many :group_retentions
  belongs_to :data_to_ask
  validates_presence_of		    :detalle,	:acumuladores_valor, :formula_calculo_valor	, :message => "es un dato requerido"
end
