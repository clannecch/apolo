# == Schema Information
# Schema version: 20110621182933
#
# Table name: liquidacions
#
#  id                :integer         not null, primary key
#  periodo           :string(255)
#  fecha_liquidacion :date
#  fecha_deposito    :date
#  bank_deposit_id   :integer
#  periodo_deposito  :string(255)
#  fecha_cierre      :date
#  quincena          :integer
#  techo_retenciones :decimal(, )
#  created_at        :datetime
#  updated_at        :datetime
#  tipo_recibo_id    :integer
#

require 'test_helper'

class LiquidacionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
