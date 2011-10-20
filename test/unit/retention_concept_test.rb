# == Schema Information
# Schema version: 20111013184648
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
#  company_id               :integer
#  auxiliar                 :boolean
#

require 'test_helper'

class RetentionConceptTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
