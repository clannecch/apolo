# == Schema Information
# Schema version: 20110910142220
#
# Table name: employee_familiars
#
#  id                  :integer         not null, primary key
#  apellido            :string(255)
#  nombre              :string(255)
#  fecha_nacimiento    :date
#  numero_documento    :integer
#  health_insurance_id :integer
#  cuil                :string(255)
#  cuit                :string(255)
#  tomo                :string(255)
#  folio               :string(255)
#  acta                :string(255)
#  country_id          :integer
#  province_id         :integer
#  comuna              :string(255)
#  employee_id         :integer
#  document_type_id    :integer
#  activity_id         :integer
#  created_at          :datetime
#  updated_at          :datetime
#  kinship_id          :integer
#

require 'test_helper'

class EmployeeFamiliarTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
