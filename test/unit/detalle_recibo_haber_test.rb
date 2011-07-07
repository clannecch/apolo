# == Schema Information
# Schema version: 20110706162424
#
# Table name: detalle_recibo_habers
#
#  id                      :integer         not null, primary key
#  recibo_sueldo_id        :integer
#  remunerative_concept_id :integer
#  detalle                 :string(255)
#  cost_center_id          :integer
#  cantidad                :decimal(, )
#  importe                 :decimal(, )
#  total                   :decimal(, )
#  created_at              :datetime
#  updated_at              :datetime
#  cantidad_recibo         :decimal(, )
#

require 'test_helper'

class DetalleReciboHaberTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
