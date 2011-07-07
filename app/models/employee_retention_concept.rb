class EmployeeRetentionConcept < ActiveRecord::Base
  belongs_to :employee
  belongs_to :retention_concept

  validates_presence_of		    :retention_concept_id ,															:message => "es un dato requerido"
  validates_numericality_of   :cantidad, :if => :cantidad?
  validates_numericality_of   :importe, :allow_blank => true

  validates_with RetentionConceptsDataToAskValidator, :campos => [:cantidad, :importe], :if => :remunerative_concept_id?

end
