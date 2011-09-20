# == Schema Information
# Schema version: 20110721162735
#
# Table name: employee_retention_concepts
#
#  id                   :integer         not null, primary key
#  employee_id          :integer
#  retention_concept_id :integer
#  cantidad             :integer
#  importe              :float
#  fecha_inicio         :date
#  fecha_final          :date
#  created_at           :datetime
#  updated_at           :datetime
#  detalle              :text
#

class EmployeeRetentionConcept < ActiveRecord::Base
  belongs_to :employee
  belongs_to :retention_concept

  validates_presence_of		    :retention_concept_id ,															:message => "es un dato requerido"
  validates_numericality_of   :cantidad, :if => :cantidad?
  validates_numericality_of   :importe, :allow_blank => true

  validates_with RetentionConceptsDataToAskValidator, :campos => [:cantidad, :importe], :if => :retention_concept_id?

end
