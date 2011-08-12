class EmployeeFamiliar < ActiveRecord::Base
	belongs_to :employee
	belongs_to :activity
	belongs_to :document_type
	belongs_to :health_insurance
	

	validates_presence_of		  :nombre,															                      :message => "es un dato requerido"
	validates_presence_of		  :apellido,									                						    :message => "es un dato requerido"
	validates_presence_of		  :numero_documento,                													:message => "es un dato requerido"
  validates_presence_of		  :fecha_nacimiento,						                							:message => "es un dato requerido"

  validates_numericality_of :numero_documento, :greater_than_or_equal_to => 0,					:message => "acepta valores positivos"

end
