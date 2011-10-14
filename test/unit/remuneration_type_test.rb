# == Schema Information
# Schema version: 20111013184648
#
# Table name: remuneration_types
#
#  id           :integer         not null, primary key
#  detalle      :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  company_id   :integer
#  hora_dia_mes :string(255)
#

require 'test_helper'

class RemunerationTypeTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
