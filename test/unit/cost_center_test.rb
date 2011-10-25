# == Schema Information
# Schema version: 20111025214836
#
# Table name: cost_centers
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  company_id :integer
#  code       :string(255)
#  default    :boolean
#

require 'test_helper'

class CostCenterTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
