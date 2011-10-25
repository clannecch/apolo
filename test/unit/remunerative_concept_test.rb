# == Schema Information
# Schema version: 20111024224627
#
# Table name: remunerative_concepts
#
#  id                               :integer         not null, primary key
#  codigo                           :string(255)
#  detalle                          :string(255)
#  prioridad_calculo                :integer
#  statistical_value                :integer
#  grupo_ganancias_id               :integer
#  accounting_imputation_id         :integer
#  concepto_asociado_haber_id       :integer
#  concepto_asociado_retencion_id   :integer
#  concepto_asociado_haber_2_id     :integer
#  concepto_asociado_retencion_2_id :integer
#  created_at                       :datetime
#  updated_at                       :datetime
#  acumuladores_valor               :string(255)
#  acumuladores_cantidad            :string(255)
#  calculo_valor                    :string(255)
#  calculo_cantidad                 :string(255)
#  data_to_ask_id                   :integer
#  cantidad_en_recibo               :string(255)
#  company_id                       :integer
#  auxiliar                         :boolean
#

require 'test_helper'

class RemunerativeConceptTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
