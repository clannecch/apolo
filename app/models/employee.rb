# == Schema Information
# Schema version: 20110513210029
#
# Table name: employees
#
#  id                               :integer         not null, primary key
#  legajo                           :string(255)
#  nombre                           :string(255)
#  apellido                         :string(255)
#  telefono                         :string(255)
#  document_type_id                 :integer
#  numero_documento                 :decimal(, )
#  issued_id                        :integer
#  sexo                             :string(255)
#  nationality_id                   :integer
#  marital_status_id                :integer
#  fecha_nacimiento                 :date
#  calle                            :string(255)
#  puerta                           :string(255)
#  piso                             :string(255)
#  departamento                     :string(255)
#  location_id                      :integer
#  province_id                      :integer
#  country_id                       :integer
#  codigo_postal                    :string(255)
#  created_at                       :datetime
#  updated_at                       :datetime
#  movil                            :string(255)
#  email                            :string(255)
#  category_id                      :integer
#  section_id                       :integer
#  task_id                          :integer
#  place_id                         :integer
#  character_service_id             :integer
#  matricula_nacional               :string(255)
#  matricula_provincial             :string(255)
#  discapacidad                     :string(255)
#  health_insurance_id              :integer
#  plan_osocial                     :string(255)
#  numero_afiliado_osocial          :string(255)
#  cargas_extras_osocial            :integer
#  labor_union_id                   :integer
#  numero_afiliado_sindicato        :string(255)
#  numero_jubilacion                :string(255)
#  numero_ganancias                 :string(255)
#  cuit                             :string(255)
#  cuil                             :string(255)
#  fecha_ingreso                    :date
#  fecha_egreso                     :date
#  horas_pactadas                   :decimal(, )
#  remuneracion_fuera_convenio      :decimal(, )
#  remuneration_type_id             :integer
#  group_renumbering_id             :integer
#  group_retention_id               :integer
#  cost_center_id                   :integer
#  antiguedad_reconocida_anos       :integer
#  antiguedad_reconocida_meses      :integer
#  retencion_minima_osocial         :decimal(, )
#  educational_level_id             :integer
#  id_card                          :integer
#  numero_cofre                     :string(255)
#  contract_mode_id                 :integer
#  home_about_id                    :integer
#  cuadras_asfalto                  :integer
#  domicilio_entre_calle_izquierda  :string(255)
#  domicilio_entre_calle_derecha    :string(255)
#  domicilio_entre_calles_detras    :string(255)
#  domicilio_avenida_cercana        :string(255)
#  domicilio_avenida_cercana_altura :integer
#  email_type_id                    :integer
#  employment_id                    :integer
#  accounting_imputation_id         :integer
#  insurance_company_id             :integer
#  seguro_conyuge                   :string(255)
#  Seguro_numero_poliza             :string(255)
#  seguro_monto_asegurado           :decimal(, )
#  bank_deposit_id                  :integer
#  bank_deposit_account_type_id     :integer
#  deposito_banco_cuenta            :string(255)
#  deposito_banco_cbu               :string(255)
#  group_employer_contribution_id   :integer
#

class Employee < ActiveRecord::Base
	belongs_to :document_type
	belongs_to :nationality
	belongs_to :marital_status
	belongs_to :issued
	belongs_to :location
	belongs_to :province
	belongs_to :country
	belongs_to :character_service
	belongs_to :health_insurance
	belongs_to :labor_union
	belongs_to :place
	belongs_to :section
	belongs_to :task
	belongs_to :category
	belongs_to :remuneration_type
	belongs_to :group_renumbering
	belongs_to :group_employer_contribution
	belongs_to :group_retention
	belongs_to :cost_center
	belongs_to :home_about
	belongs_to :contract_mode
	belongs_to :accounting_imputation
	belongs_to :employment
	belongs_to :insurance_company
	belongs_to :bank_deposit_account_type
	belongs_to :bank_deposit
	has_many   :insurance_beneficiaries
	has_many   :employee_familiars
	
	accepts_nested_attributes_for :employee_familiars, :allow_destroy => true
	accepts_nested_attributes_for :insurance_beneficiaries, :allow_destroy => true
	
  validates_uniqueness_of		  :numero_documento, :scope => :document_type_id,						      :message => "existente"
	validates_uniqueness_of 	  :legajo , :case_sensitive => false,									            :message => "existente"
	validates_length_of			    :apellido, :maximum => 30 , :minimum => 2	, 						        :message => "longitud invalida"
	validates_length_of			    :nombre, :maximum => 30 , :minimum => 2	, 							        :message => "longitud invalida"

	validates_format_of			    :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "direccion invalida"
	
	validates_inclusion_of		  :antiguedad_reconocida_meses, :in => 0..11, 							      :message => "acepta valores del 0 al 11"
	
	validates_numericality_of 	:numero_documento, :greater_than_or_equal_to => 0,					    :message => "acepta valores positivos"
  validates_numericality_of 	:horas_pactadas, :greater_than_or_equal_to => 0,					      :message => "acepta valores positivos"
  validates_numericality_of 	:remuneracion_fuera_convenio, :greater_than_or_equal_to => 0,		:message => "acepta valores positivos"
  validates_numericality_of 	:antiguedad_reconocida_anos, :greater_than_or_equal_to => 0,		:message => "acepta valores positivos"
  validates_numericality_of 	:antiguedad_reconocida_meses,										                :message => "acepta valores positivos"
  validates_numericality_of 	:retencion_minima_osocial, :greater_than_or_equal_to => 0,			:message => "acepta valores positivos"
  validates_numericality_of 	:seguro_monto_asegurado, :greater_than_or_equal_to => 0,			  :message => "acepta valores positivos"

	validates_presence_of		    :nombre,															                          :message => "es un dato requerido"
	validates_presence_of		    :apellido,															                        :message => "es un dato requerido"
	validates_presence_of		    :numero_documento,													                    :message => "es un dato requerido"
	validates_presence_of		    :legajo,															                          :message => "es un dato requerido"
  validates_presence_of		    :telefono,															                        :message => "es un dato requerido"
  validates_presence_of		    :fecha_nacimiento,													                    :message => "es un dato requerido"
  validates_presence_of		    :calle, 															                          :message => "es un dato requerido"
  validates_presence_of		    :puerta,															                          :message => "es un dato requerido"
  validates_presence_of		    :fecha_ingreso,														                      :message => "es un dato requerido"
  validates_presence_of		    :deposito_banco_cuenta,												                  :message => "es un dato requerido"
  validates_presence_of		    :document_type_id,													                    :message => "es un dato requerido"
  validates_presence_of		    :issued_id,															                        :message => "es un dato requerido"
  validates_presence_of		    :sexo,																                          :message => "es un dato requerido"
  validates_presence_of		    :marital_status_id,													                    :message => "es un dato requerido"
  validates_presence_of		    :fecha_nacimiento,													                    :message => "es un dato requerido"

  validates_presence_of		    :category_id,														                        :message => "es un dato requerido"
  validates_presence_of		    :health_insurance_id,												                    :message => "es un dato requerido"
  validates_presence_of		    :remuneration_type_id,												                  :message => "es un dato requerido"
  validates_presence_of		    :group_renumbering_id,												                  :message => "es un dato requerido"
  validates_presence_of		    :group_retention_id,												                    :message => "es un dato requerido"
  validates_presence_of		    :cost_center_id,													                      :message => "es un dato requerido"
  validates_presence_of		    :contract_mode_id,													                    :message => "es un dato requerido"
  validates_presence_of		    :accounting_imputation_id,											                :message => "es un dato requerido"
  validates_presence_of		    :group_employer_contribution_id,									              :message => "es un dato requerido"

end
