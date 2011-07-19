require 'paperclip'
class Employee < ActiveRecord::Base
#  attr_accessible  :full_address, :latitude, :longitude

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }
#                :url  => "/system/products/:id/:style/:basename.:extension"



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

  validate                    :fechanacimientovalida

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

  def fechanacimientovalida
#    fn =  ( (Date.today.year-18).to_s+"-01-01").to_date
    #errors.add(:base, fn.to_s+ " - "+fecha_nacimiento.to_s)
    #errors.add(:base, __method__.to_s+ " - "+fecha_nacimiento_change.to_s)

    #errors.add(:base, attributes.inspect)
    if fecha_nacimiento >  18.years.ago.to_date
      errors.add(:base, "Fecha de nacimiento erronea ")
    end
  end

  private
  def full_name
#    apellido + ', '+nombre
   [apellido, nombre].compact.join(' ')
  end

  def full_address
   [calle, puerta, location.detalle, province.detalle , country.detalle].compact.join(', ')
  end
end
