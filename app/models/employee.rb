# == Schema Information
# Schema version: 20110910142220
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
#  group_remuneration_id            :integer
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
#  causa_egreso_id                  :integer
#  foto                             :binary
#  company_id                       :integer
#  latitude                         :float
#  longitude                        :float
#  avatar_file_name                 :string(255)
#  avatar_content_type              :string(255)
#  avatar_file_size                 :integer
#  avatar_updated_at                :datetime
#  sicoss_reduccion                 :string(255)
#  sicoss_employer_type_id          :integer
#  sicoss_situation_id              :integer
#  sicoss_condition_id              :integer
#  sicoss_activity_id               :integer
#  sicoss_contract_mode_id          :integer
#  sicoss_damaged_id                :integer
#  sicoss_location_id               :integer
#  sicoss_reduction_zone_id         :integer
#  sicoss_en_convenio               :string(255)
#  sicoss_regimen_type_id           :integer
#  sicoss_seguro_obligatorio        :string
#

require 'paperclip'
class Employee < ActiveRecord::Base

#  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
##                :url  => "/system/products/:id/:style/:basename.:extension"

  has_many :attachments, :as => :attachable

  accepts_nested_attributes_for :attachments , :allow_destroy => true

# validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png', 'image/gif']
  scope :by_company, lambda {|company| where(:company_id => company) }

  belongs_to :document_type
  belongs_to :educational_level
	belongs_to :nationality
	belongs_to :marital_status
	belongs_to :issued
	belongs_to :location
	belongs_to :province
  belongs_to :country
  belongs_to :email_type
	belongs_to :character_service
	belongs_to :health_insurance
	belongs_to :labor_union
	belongs_to :place
	belongs_to :section
	belongs_to :task
  belongs_to :causa_egreso
	belongs_to :category
	belongs_to :remuneration_type
	belongs_to :group_remuneration
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
  belongs_to :sicoss_eployer_type
  belongs_to :sicoss_situation
  belongs_to :sicoss_condition
  belongs_to :sicoss_activity
  belongs_to :sicoss_contract_mode
  belongs_to :sicoss_damaged
  belongs_to :sicoss_location
  belongs_to :sicoss_reduction_zone
  belongs_to :sicos_seguro_obligatorio
  belongs_to :sicoss_regimen_type
	has_many   :insurance_beneficiaries
  has_many   :employee_familiars
  has_many   :employee_remunerative_concepts
  has_many   :employee_retention_concepts

	accepts_nested_attributes_for :employee_familiars, :allow_destroy => true
  accepts_nested_attributes_for :insurance_beneficiaries, :allow_destroy => true
  accepts_nested_attributes_for :employee_remunerative_concepts, :allow_destroy => true
  accepts_nested_attributes_for :employee_retention_concepts, :allow_destroy => true

  geocoded_by :full_address
  after_validation :geocode, :if => lambda{ |employee| :full_address_changed? }
#  , :if => :address_changed?





# solapa datos personales
  validates_presence_of		    :legajo            ,:nombre            ,:apellido,
                               :document_type_id ,:numero_documento  ,:telefono,
                               :issued_id        ,:sexo              ,:nationality_id,
                               :marital_status_id,:fecha_nacimiento,													:message => "es un dato requerido"

  validates_numericality_of 	:numero_documento,
                              :greater_than_or_equal_to => 0,					                        :message => "acepta valores positivos"

  validates_uniqueness_of		  :numero_documento,
                              :scope => :document_type_id,						                        :message => "existente"

	validates_uniqueness_of 	  :legajo ,
                              :case_sensitive => false,									                      :message => "existente"

	validates_length_of			    :apellido         , :nombre             ,
                              :maximum => 30    ,
                              :minimum => 2	    , 							                              :message => "longitud invalida"

  validate                    :fechanacimientovalida, :control_porcentaje_seguro

# Solapa Domicilio
  validates_presence_of		    :telefono         ,:calle               ,:puerta,
                      		    :location_id      ,:province_id         ,:country_id,
                      		    :movil,   														                          :message => "es un dato requerido"

  validates_format_of			    :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "direccion invalida"


# Solapa Ocupacion
  validates_presence_of		    :category_id      ,:section_id          ,:task_id,
                              :place_id         ,:employment_id       ,:character_service_id, :message => "es un dato requerido"

# Solapa Filiacion
  validates_presence_of		    :health_insurance_id      ,
                      		    :numero_afiliado_osocial  ,
                              :labor_union_id        ,
                              :numero_afiliado_sindicato,	:cuil,												      :message => "es un dato requerido"

  validates_numericality_of 	:retencion_minima_osocial,  :cargas_extras_osocial ,
                              :allow_nil => true,
                              :only_integer => true,                          					      :message => "acepta 0 o valores positivos"
  validates_numericality_of 	:retencion_minima_osocial,
                              :allow_nil => true,
                              :greater_than_or_equal_to => 0,                          				:message => "acepta 0 o valores positivos"


# Solapa Contratacion
  validates_presence_of		    :fecha_ingreso     , :contract_mode_id              , :fecha_ingreso,
                              :remuneration_type_id          , :group_remuneration_id,
                              :group_retention_id, :group_employer_contribution_id,	:cost_center_id,
                              :accounting_imputation_id,											                :message => "es un dato requerido"
  validates_presence_of		    :causa_egreso_id ,
                              :if => :fecha_egreso?

  validates_numericality_of 	:antiguedad_reconocida_anos , :horas_pactadas,
                              :remuneracion_fuera_convenio, :retencion_minima_osocial,
                              :allow_nil => true,
                              :greater_than_or_equal_to => 0,                          				:message => "acepta 0 o valores positivos"

  validates_inclusion_of		  :antiguedad_reconocida_meses, :in => 0..11, :allow_nil => true, 							      :message => "acepta valores del 0 al 11"



# Aseguradora / Banco
  validates_presence_of		    :deposito_banco_cuenta, :bank_deposit_id,
                              :bank_deposit_account_type_id,                                  :message => "es un dato requerido"

  validates_numericality_of 	:seguro_monto_asegurado ,
                              :allow_nil => true,
                              :greater_than_or_equal_to => 0,                                 :message => "acepta 0 o valores positivos"



# Otras formas mas faciles de validar
#
#  with_options :message => "es un dato requerido" do |defaults_options|
#    defaults_options.validates_presence_of		    :fecha_ingreso
#    defaults_options.validates_presence_of		    :contract_mode_id
#  end
#
#  [:horas_pactadas, :fecha_ingreso].each do |campito|
#    validates_presence_of		    campito,														                    :message => "es un dato requerido"
#    validates_numericality_of 	campito, :greater_than_or_equal_to => 0,					      :message => "acepta 0 o valores positivos"
#  end


  def control_porcentaje_seguro
    porcentual = 0
    insurance_beneficiaries.each do |i|
      porcentual += i.porcentual
    end
    if porcentual != 100 && porcentual != 0
      errors.add(:base, "La suma de los porcentualesde Beneficiario de Seguro debe ser = 100("+porcentual.to_s+")")
    end
  end

  def fechanacimientovalida
#    fn =  ( (Date.today.year-18).to_s+"-01-01").to_date
    #errors.add(:base, fn.to_s+ " - "+fecha_nacimiento.to_s)
    #errors.add(:base, __method__.to_s+ " - "+fecha_nacimiento_change.to_s)

    #errors.add(:base, attributes.inspect)
    if fecha_nacimiento.blank?
    else
      if fecha_nacimiento >  18.years.ago.to_date
        errors.add(:base, "Fecha de nacimiento erronea ")
      end
    end
  end

  private
  def full_name
#    apellido + ', '+nombre
   [apellido, nombre].compact.join(' ')
  end

  def full_address
   [(calle.blank? ? '' : calle), (puerta.blank? ? '' : puerta), (location_id.blank? ? '' : location.detalle),
      (province_id.blank? ? '' : province.detalle) , (country_id.blank? ? '' : country.detalle)].compact.join(', ')
  end
end
11
