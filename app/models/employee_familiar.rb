# == Schema Information
# Schema version: 20110513210029
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
#

class EmployeeFamiliar < ActiveRecord::Base
	belongs_to :employee
	belongs_to :activity
	has_many :document_types
	has_many :health_insurance
	

	validates_presence_of		  :nombre,															                      :message => "es un dato requerido"
	validates_presence_of		  :apellido,									                						    :message => "es un dato requerido"
	validates_presence_of		  :numero_documento,                													:message => "es un dato requerido"
  validates_presence_of		  :fecha_nacimiento,						                							:message => "es un dato requerido"

  validates_numericality_of :numero_documento, :greater_than_or_equal_to => 0,					:message => "acepta valores positivos"

end
