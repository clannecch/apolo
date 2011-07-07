require 'custom_validators'

class EmployeeRemunerativeConcept < ActiveRecord::Base
  belongs_to :employee
  belongs_to :remunerative_concept

  validates_presence_of		    :remunerative_concept_id ,															:message => "es un dato requerido"
  validates_numericality_of   :cantidad, :if => :cantidad?
  validates_numericality_of   :importe, :allow_blank => true

  validates_with RemunerativeConceptsDataToAskValidator, :campos => [:cantidad, :importe], :if => :remunerative_concept_id?
end