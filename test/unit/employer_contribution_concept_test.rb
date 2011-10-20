# == Schema Information
# Schema version: 20111013184648
#
# Table name: employer_contribution_concepts
#
#  id                             :integer         not null, primary key
#  codigo                         :string(255)
#  detalle                        :string(255)
#  statistical_value              :integer
#  accounting_imputation_id       :integer
#  created_at                     :datetime
#  updated_at                     :datetime
#  prioridad                      :integer
#  acumuladores_valor             :string(255)
#  formula_calculo_valor          :string(255)
#  company_id                     :integer
#  aditional_halth_insurance_id   :integer
#  retention_concept_id           :integer
#  additional_health_insurance_id :integer
#  health_insurance_id            :integer
#

require 'test_helper'

class EmployerContributionConceptTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
