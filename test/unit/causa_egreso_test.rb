# == Schema Information
# Schema version: 20110721162735
#
# Table name: causa_egresos
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  company_id :integer
#

require 'test_helper'

class CausaEgresoTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
