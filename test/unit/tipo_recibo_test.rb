# == Schema Information
# Schema version: 20111025214836
#
# Table name: tipo_recibos
#
#  id               :integer         not null, primary key
#  detalle          :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  company_id       :integer
#  recibo_principal :boolean
#  default          :boolean
#

require 'test_helper'

class TipoReciboTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
