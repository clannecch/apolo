# == Schema Information
# Schema version: 20110721162735
#
# Table name: employee_remunerative_concepts
#
#  id                      :integer         not null, primary key
#  employee_id             :integer
#  remunerative_concept_id :integer
#  cantidad                :integer
#  importe                 :float
#  fecha_inicio            :date
#  fecha_final             :date
#  created_at              :datetime
#  updated_at              :datetime
#  cost_center_id          :integer
#  detalle                 :text
#

require 'test_helper'

class EmployeeRemunerativeConceptTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
