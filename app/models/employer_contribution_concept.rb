class EmployerContributionConcept < ActiveRecord::Base
  has_and_belongs_to_many :group_employer_contribution
end
