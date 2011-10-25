# == Schema Information
# Schema version: 20111024224627
#
# Table name: provinces
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  company_id :integer
#  code       :string(255)
#  country_id :integer
#

require 'test_helper'

class ProvinceTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
