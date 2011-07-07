# == Schema Information
# Schema version: 20110706162424
#
# Table name: liquidacions
#
#  id                :integer         not null, primary key
#  fecha_liquidacion :date
#  fecha_deposito    :date
#  bank_deposit_id   :integer
#  fecha_cierre      :date
#  quincena          :integer
#  techo_retenciones :decimal(, )
#  created_at        :datetime
#  updated_at        :datetime
#  tipo_recibo_id    :integer
#  periodo           :date
#  periodo_deposito  :date
#

require 'test_helper'

class LiquidacionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
