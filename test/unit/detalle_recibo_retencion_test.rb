# == Schema Information
# Schema version: 20110621182933
#
# Table name: detalle_recibo_retencions
#
#  id                   :integer         not null, primary key
#  recibo_sueldo_id     :integer
#  retention_concept_id :integer
#  detalle              :string(255)
#  cost_center_id       :integer
#  cantidad             :decimal(, )
#  importe              :decimal(, )
#  total                :decimal(, )
#  created_at           :datetime
#  updated_at           :datetime
#

require 'test_helper'

class DetalleReciboRetencionTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
