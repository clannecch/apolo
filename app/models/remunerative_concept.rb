# == Schema Information
# Schema version: 20110721162735
#
# Table name: remunerative_concepts
#
#  id                               :integer         not null, primary key
#  codigo                           :string(255)
#  detalle                          :string(255)
#  porcentual_asistencia            :boolean
#  prioridad_calculo                :integer
#  statistical_value                :integer
#  grupo_ganancias_id               :integer
#  accounting_imputation_id         :integer
#  concepto_asociado_haber_id       :integer
#  concepto_asociado_retencion_id   :integer
#  concepto_asociado_haber_2_id     :integer
#  concepto_asociado_retencion_2_id :integer
#  created_at                       :datetime
#  updated_at                       :datetime
#  acumuladores_valor               :string(255)
#  acumuladores_cantidad            :string(255)
#  calculo_valor                    :string(255)
#  calculo_cantidad                 :string(255)
#  data_to_ask_id                   :integer
#  cantidad_en_recibo               :string(255)
#  company_id                       :integer
#

class RemunerativeConcept < ActiveRecord::Base
  paginates_per 10
  scope :by_company, lambda {|company| where(:company_id => company) }
  belongs_to :concepto_asociado_haber, :class_name => "RemunerativeConcept"
  belongs_to :concepto_asociado_retencion, :class_name => "RetentionConcept"
  belongs_to :concepto_asociado_haber_2, :class_name => "RemunerativeConcept"
  belongs_to :concepto_asociado_retencion_2, :class_name => "RetentionConcept"
  belongs_to :data_to_ask
  belongs_to :accounting_imputation
  has_many :detalle_recibo_habers, :dependent => :restrict
  has_and_belongs_to_many :group_remunerations
  validate :cannot_asociate_iqual_concept
  validates_presence_of :detalle, :codigo, :acumuladores_valor, :calculo_valor

  before_save :controlar_cambios

  @Recalcular = false

  def controlar_cambios
    @Recalcular = ( calculo_valor         != calculo_valor_was          ) ||
                  ( calculo_cantidad      != calculo_cantidad_was       ) ||
                  ( prioridad_calculo     != prioridad_calculo_was      ) ||
                  ( acumuladores_valor    != acumuladores_valor_was     ) ||
                  ( acumuladores_cantidad != acumuladores_cantidad_was  ) ||
                  ( data_to_ask_id        != data_to_ask_id_was)
    return true
  end

  def cambio_algo
    return @Recalcular
  end

  def calculate_changes
      Liquidacion.where(:fecha_cierre.nil?).each do |l|
        Rails.logger.info("Periodo=: "+l.periodo_deposito.to_s)
        recibos=ReciboSueldo.joins(:detalle_recibo_habers).where(:liquidacion_id => l.id).where("detalle_recibo_habers.remunerative_concept_id" => self.id)
        recibos.each do |r|
          r.calcular_recibo
        end
      end
  end


  def cannot_asociate_iqual_concept
    if (self.concepto_asociado_haber_id == self.concepto_asociado_haber_2_id) && !self.concepto_asociado_haber_id.nil?
      errors.add(:base, 'No puede asociar 2 veces el mismo haber')
    end
  end

  def all_without_myself
    (new_record?) ? RemunerativeConcept.all : (RemunerativeConcept.all - [self])
  end

  def to_s
    self.try(:detalle) || 'n/a'
  end

end


=begin

belongs_to :author

obj.author

asumo que
- guardaste en RemunerativeConcept campo author_id el numero de referencia
- El objeto en cuestion sera Autor.find(el numero de referencia almacenado)


belongs_to :author, :class_name => "Person"

obj.author

asumo que
- guardaste en RemunerativeConcept campo author_id el numero de referencia
- El objeto en cuestion sera Person.find(el numero de referencia almacenado)



belongs_to :author, :class_name => "Person", :foreign_key => "REF_PERSONA_ASOCIADA_ID"

obj.author

asumo que
- guardaste en RemunerativeConcept campo REF_PERSONA_ASOCIADA_ID el numero de referencia
- El objeto en cuestion sera Person.find(el numero de referencia almacenado)


has_many :authors, :class_name => "Person"#, :foreign_key => "remunerative_concept_id"

=end
