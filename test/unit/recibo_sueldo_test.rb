# == Schema Information
# Schema version: 20111013184648
#
# Table name: recibo_sueldos
#
#  id             :integer         not null, primary key
#  liquidacion_id :integer
#  employee_id    :integer
#  fecha_recibo   :date
#  observaciones  :string(255)
#  mensaje_recibo :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#  fecha_calculo  :datetime
#

require 'test_helper'

class ReciboSueldoTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
