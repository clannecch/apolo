# == Schema Information
# Schema version: 20111013184648
#
# Table name: insurance_beneficiaries
#
#  id               :integer         not null, primary key
#  nombre           :string(255)
#  apellido         :string(255)
#  document_type_id :integer
#  numero_documento :integer
#  created_at       :datetime
#  updated_at       :datetime
#  employee_id      :integer
#  fecha_nacimiento :date
#  address          :string(255)
#  kinship_id       :integer
#  porcentual       :decimal(, )
#

require 'test_helper'

class InsuranceBeneficiaryTest < ActiveSupport::TestCase
  # Replace this with your real tests.
  test "the truth" do
    assert true
  end
end
