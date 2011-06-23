# == Schema Information
# Schema version: 20110621182933
#
# Table name: recibo_sueldos
#
#  id             :integer         not null, primary key
#  liquidacion_id :integer
#  employee_id    :integer
#  fecha_recibo   :date
#  observaciones  :string(255)
#  mensaje_recibo :string(255)
#  created_at     :datetime
#  updated_at     :datetime
#

require 'ostruct'

class ReciboSueldo < ActiveRecord::Base

  belongs_to              :employee
  belongs_to              :liquidacion

  has_many                :detalle_recibos

  validates_presence_of		:employee_id ,	:message => "es un dato requerido"
  validates_uniqueness_of :employee_id ,  :message => "existe liquidacion activa"

  has_many                :detalle_recibo_habers
  accepts_nested_attributes_for :detalle_recibo_habers, :allow_destroy => true

  has_many                :detalle_recibo_retencions
  accepts_nested_attributes_for :detalle_recibo_retencions, :allow_destroy => true

  after_validation        :carga_codigo_predefinido_create, :on => :create, :if => :employee_id?
#  after_validation        :carga_codigo_predefinido_update, :on => :update, :if => :employee_id?

# El uso de attr_accessor determinó que se definan dos nuevos métodos por nosotros:
#     acumuladores para obtener el valor
#    acumuladores= para modificarlo.
  cattr_accessor :acumuladores

# ":cantidad * @basico"
# "self.cantidad * acumuladores.basico"
  def calcular_recibo

    self.acumuladores = OpenStruct.new({
          :sueldo                       => 0,
          :valor_dia                    => 0,
          :valor_hora                   => 0,
          :mejor_remuneracion_semestre  => 0,
          :remuneraciones_con_descuento => 0,
          :remuneraciones_sin_descuento => 0,
          :retenciones                  => 0,
          :total_remuneraciones         => 0,
          :total_retenciones            => 0,
          :horas_tabajadas              => 0,
          :antiguedad                   => calculo_antiguedad(self.employee.fecha_ingreso ,self.liquidacion.periodo)
        })

#   acumuladores predefinidos
    if employee.remuneration_type_id = 3
        if self.employee.remuneracion_fuera_convenio != 0
          self.acumuladores.sueldo = self.employee.remuneracion_fuera_convenio
        else
          self.acumuladores.sueldo = self.employee.category.importe
        end
        self.acumuladores.valor_dia = self.acumuladores.sueldo / 30
        self.acumuladores.valor_hora= self.acumuladores.sueldo / self.employee.horas_pactadas
    elsif employee.remuneration_type_id = 2
        self.acumuladores.valor_dia = self.employee.remuneracion_fuera_convenio
        self.acumuladores.valor_hora= self.employee.remuneracion_fuera_convenio / self.employee.horas_pactadas  / 30
    else
        self.acumuladores.valor_hora= self.employee.remuneracion_fuera_convenio
    end

#   ejecuta una select sobre recibo_habers haciendo un join con remunerative concepts para traer prioridad de calculo
#   toma cada elemento del array y lo deja en detalle_recibo_haber y lo ordena por prioridad
    detalle_recibo_habers.joins(:remunerative_concept).order("remunerative_concepts.prioridad_calculo").each do |detalle_recibo_haber|
#      controla error
      begin
#       graba en el log
        Rails.logger.info("procesando calculo: #{detalle_recibo_haber.remunerative_concept.calculo_valor}")
#       actualiza la propiedad total de detelle_recibo_haber conel resultado de la evaluacion de la transformacion del calculo
        detalle_recibo_haber.update_attributes(:total => detalle_recibo_haber.instance_eval(prepare_calculo_for_evaluation(detalle_recibo_haber.remunerative_concept.calculo_valor)))
      rescue => e
#       apila el error (mostrando cual es) y continua
        errors.add(:base, "Error de calculo Haber #{detalle_recibo_haber.remunerative_concept.codigo}: #{prepare_calculo_for_evaluation(detalle_recibo_haber.remunerative_concept.calculo_valor)}\n#{e.message}")
        next
      end
#     acumula en cada uno de los acumuladores de remunerative_concepts.acumuladores el split separa por palabra el default de separador es ' '
      detalle_recibo_haber.remunerative_concept.acumuladores_valor.split(' ').each do |acumulador|
#       acumula total, para eso arma con send la posicion donde debe acumular(el si el acumulador contiene sueldo_basico,
#       al ejecutarse el send aacumularia en acumuladores.sueldo_basico
        self.acumuladores.send("#{acumulador}=", self.acumuladores.send(acumulador).to_f + detalle_recibo_haber.total.to_f)
      end
    end

    detalle_recibo_retencions.joins(:retention_concept).order("retention_concepts.prioridad").each do |detalle_recibo_retencion|
#      controla error
      begin
#       actualiza la propiedad total de detelle_recibo_haber conel resultado de la evaluacion de la transformacion del calculo
        detalle_recibo_retencion.total = detalle_recibo_retencion.instance_eval(prepare_calculo_for_evaluation(detalle_recibo_retencion.retention_concept.formula_calculo_valor))
      rescue => e
#       apila el error (mostrando cual es) y continua
        errors.add(:base, "Error de calculo Retencion: #{prepare_calculo_for_evaluation(detalle_recibo_retencion.retention_concept.formula_calculo_valor)}\n#{e.message}")
        next
      end
      detalle_recibo_retencion.retention_concept.acumuladores_valor.split(' ').each do |acumulador|
        acumuladores.send("#{acumulador}=", acumuladores.send(acumulador).to_f + detalle_recibo_haber.total.to_f)
      end
    end
  end

  def carga_codigo_predefinido_create

      detalle_recibo_haber_adicionados = self.employee.group_remuneration.remunerative_concepts.map do |rc|
        detalle_recibo_habers.build(:remunerative_concept_id => rc.id, :cost_center_id => employee.cost_center_id)
      end

      self.employee.group_retention.retention_concepts.each do |rc|
        detalle_recibo_retencions.build(:retention_concept_id => rc.id, :cost_center_id => employee.cost_center_id)
      end

      detalle_recibo_haber_adicionados.each do |rc|
        if rc.remunerative_concept.concepto_asociado_haber_id.present?
          detalle_recibo_habers.build(:remunerative_concept_id => rc.remunerative_concept.concepto_asociado_haber_id, :cost_center_id => employee.cost_center_id)
        end
        if rc.remunerative_concept.concepto_asociado_haber_2_id.present?
          detalle_recibo_habers.build(:remunerative_concept_id => rc.remunerative_concept.concepto_asociado_haber_2_id, :cost_center_id => employee.cost_center_id)
        end
      end
  end

  def carga_codigo_predefinido_update
    detalle_recibo_habers.dup.each do |drh|
      if drh.new_record? && drh.remunerative_concept.concepto_asociado_haber_id.present?
          detalle_recibo_habers.build(:remunerative_concept_id => drh.remunerative_concept.concepto_asociado_haber_id, :cost_center_id => employee.cost_center_id)
      end
    end
  end

# reescrive el metodo method_missing que se ejecuta cuando no encuentra un metodo
# si existe en employee ese metodo lo retorna, caso contrario continua con el default del method_missing
  def method_missing(method, *args, &block)
    if employee.respond_to?(method)
      employee.send(method, *args, &block)
    else
      super
    end
  end

  private

  #reemplaza del parametro los : por el nombre del modelo y el @ por el nombre de la colecicon de acumuladores
  def prepare_calculo_for_evaluation(str_for_evaluation)
    return 'falta indicar calculo' if str_for_evaluation.blank?
    str_for_evaluation.gsub(/\:/,'self.').gsub(/@/, 'acumuladores.')
  end

  def calculo_antiguedad (fi, pl)
      a = pl[0.3].to_i - fi.year
      a = a - 1 if fi.month >  pl[5..6].to_i
# or   (fi.month >= pl[5..6].to_i and fi.day > pl.day)
  end

  def calculo_edad(fnac, fhoy)
    (fhoy.year - fnac.year) - (fhoy.yday < fnac.yday ? 1 : 0)
  end

  def calculo_dias_trabajados_semestre(pl, ingreso , egreso)
      if pl[5..6].to_i < 7
        finicio = (pl[0.3]+"-01-01").to_date
      else
        finicio = (pl[0.3]+"-07-01").to_date
      end
      ffinal  = Date.new(pl[0.3].to_i, pl[5..6].to_I,-1)
      unless egreso.nil? && egreso > finicio &&  egreso < ffinal
        ffinal=egreso
      end
      if ingreso > finicio
        finicio= ingreso
      end
      if ingreso.year*100+ingreso.month > pl || egreso.year*100+egreso.month < pl
         diastrabajados = 0
      else
        diastrabajados= finicio - ffinal
      end
      return diastrabajados
  end

end
