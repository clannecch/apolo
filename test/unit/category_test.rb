# == Schema Information
# Schema version: 20111013184648
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  importe    :decimal(, )
#  company_id :integer
#  horas      :decimal(, )
#  codigo     :string(255)
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
