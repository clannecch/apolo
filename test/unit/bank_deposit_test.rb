# == Schema Information
# Schema version: 20110513210029
#
# Table name: bank_deposits
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#

require 'test_helper'

class BankDepositTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
