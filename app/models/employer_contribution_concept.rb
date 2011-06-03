class EmployerContributionConcept < ActiveRecord::Base
  has_and_belongs_to_many :group_employer_contribution
  validates_presence_of		    :detalle,															                          :message => "es un dato requerido"
end

