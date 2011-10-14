# == Schema Information
# Schema version: 20111013184648
#
# Table name: retention_concepts
#
#  id                       :integer         not null, primary key
#  codigo                   :string(255)
#  detalle                  :string(255)
#  statistical_value        :integer
#  accounting_imputation_id :integer
#  created_at               :datetime
#  updated_at               :datetime
#  prioridad                :integer
#  formula_calculo_valor    :string(255)
#  acumuladores_valor       :string(255)
#  data_to_ask_id           :integer
#  company_id               :integer
#  auxiliar                 :boolean
#

class RetentionConcept < ActiveRecord::Base
  scope :by_company, lambda {|company| where(:company_id => company) }
  has_and_belongs_to_many :group_retentions
  has_many :detalle_recibo_retencions , :dependent => :restrict

  belongs_to :accounting_imputation
  belongs_to :data_to_ask
  validates_presence_of		    :detalle,	:acumuladores_valor, :formula_calculo_valor	, :message => "es un dato requerido"
  validates_presence_of       :prioridad
  before_save :controlar_cambios

  @Recalcular = false

  def controlar_cambios
    @Recalcular = ( formula_calculo_valor         != formula_calculo_valor_was  ) ||
                  ( prioridad                     != prioridad_was              ) ||
                  ( acumuladores_valor            != acumuladores_valor_was     ) ||
                  ( data_to_ask_id                != data_to_ask_id_was)
    return true
  end

  def cambio_algo
    if @Recalcular
      total = 0
      Liquidacion.where(:fecha_cierre.nil?).each do |l|
        total += ReciboSueldo.joins(:detalle_recibo_retencions).where(:liquidacion_id => l.id).where("detalle_recibo_retencions.retention_concept_id" => self.id).count
      end
      Rails.logger.info("Total: "+total.to_s)
      if total < 1
        @Recalcular = false
      end
    end
    return @Recalcular
  end

  def calculate_changes
      Liquidacion.where(:fecha_cierre.nil?).each do |l|
        recibos=ReciboSueldo.joins(:detalle_recibo_retencions).where(:liquidacion_id => l.id).where("detalle_recibo_retencions.retention_concept_id" => self.id)
        recibos.each do |r|
          Rails.logger.info("Recibo: "+r.employee.legajo+" - "+r.employee.full_name)
          r.calcular_recibo
        end
      end
  end


end
