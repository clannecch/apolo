# == Schema Information
# Schema version: 20111025214836
#
# Table name: activities
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  company_id :integer
#  created_at :datetime
#  updated_at :datetime
#  code       :string(255)
#  default    :boolean
#

require 'test_helper'

class ActivityTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
