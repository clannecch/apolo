# == Schema Information
# Schema version: 20110721162735
#
# Table name: data_to_asks
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  cantidad   :boolean
#  importe    :boolean
#  created_at :datetime
#  updated_at :datetime
#  company_id :integer
#

require 'test_helper'

class DataToAskTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
