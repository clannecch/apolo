# == Schema Information
# Schema version: 20110721162735
#
# Table name: employee_remunerative_concepts
#
#  id                      :integer         not null, primary key
#  employee_id             :integer
#  remunerative_concept_id :integer
#  cantidad                :integer
#  importe                 :float
#  fecha_inicio            :date
#  fecha_final             :date
#  created_at              :datetime
#  updated_at              :datetime
#  cost_center_id          :integer
#  detalle                 :text
#

require 'custom_validators'

class EmployeeRemunerativeConcept < ActiveRecord::Base
  belongs_to :employee
  belongs_to :remunerative_concept
  belongs_to :cost_center

  validates_presence_of		    :remunerative_concept_id ,															:message => "es un dato requerido"
  validates_numericality_of   :cantidad, :if => :cantidad?
  validates_numericality_of   :importe, :allow_blank => true

#  validates_with RemunerativeConceptsDataToAskValidator, :campos => [:cantidad, :importe], :if => :remunerative_concept_id?
end
