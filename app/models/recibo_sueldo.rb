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

#ojo 29-08-2011   has_many                :detalle_recibos

  validates_presence_of		:employee_id ,	:message => "es un dato requerido"
  validates_uniqueness_of :employee_id ,  :message => "existe liquidacion activa", :scope => :liquidacion_id

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
#       errors.add(:base, "valor hora "+self.acumuladores.valor_hora.to_s)

    self.acumuladores.mejor_remuneracion_semestre              = mejor_remuneracion_semestre
    self.acumuladores.mejor_remuneracion_habitual_semestre     = mejor_remuneracion_habitual_semestre
    self.acumuladores.dias_trabajados_semestre                 = calculo_dias_trabajados_semestre(self.liquidacion.periodo,
                                                                  self.employee.fecha_ingreso, self.employee.fecha_egreso)
    self.acumuladores.dias_vacaciones                          = calculo_dias_vacaciones(self.employee.fecha_ingreso ,
                                                                  self.liquidacion.periodo)
    self.acumuladores.cantidad_sueldos_indemnizacion_despido   = calculo_cantidad_sueldos_indemnizacion_despido(
                                                                  self.employee.fecha_ingreso, self.liquidacion.periodo)
    self.acumuladores.mejor_remuneracion_habitual_anual        = calculo_mejor_remuneracion_habitual_anual
      self.acumuladores.cantidad_indemnizacion_falta_preaviso    = calculo_cantidad_indemnizacion_falta_preaviso
    self.acumuladores.dias_trabajados_mes                      = calculo_dias_trabajados_mes(self.employee.fecha_ingreso,
                                                                  self.employee.fecha_egreso)
    self.acumuladores.dias_vacaciones_no_gozadas               = calculo_dias_vacaciones_no_gozadas(self.employee.fecha_ingreso,
                                                                  self.employee.fecha_egreso, self.liquidacion.periodo)

#   ejecuta una select sobre recibo_habers haciendo un join con remunerative concepts para traer prioridad de calculo
#   toma cada elemento del array y lo deja en detalle_recibo_haber y lo ordena por prioridad
    detalle_recibo_habers.joins(:remunerative_concept).order("remunerative_concepts.prioridad_calculo").each do |detalle_recibo_haber|
#      controla error
#     graba en el log
      Rails.logger.info("procesando calculo: #{detalle_recibo_haber.remunerative_concept.calculo_valor}")
      begin
#       actualiza la propiedad total de detelle_recibo_haber conel resultado de la evaluacion de la transformacion del calculo
        detalle_recibo_haber.update_attributes(:total => detalle_recibo_haber.instance_eval(prepare_calculo_for_evaluation(detalle_recibo_haber.remunerative_concept.calculo_valor)))
#                errors.add(:base, "valor hora "+self.acumuladores.valor_hora.to_s+ ":cantidad" )
#
#                    errors.add(:base, detalle_recibo_haber.remunerative_concept.detalle+ " - calculo "+ prepare_calculo_for_evaluation(detalle_recibo_haber.remunerative_concept.calculo_valor) + " $ "+detalle_recibo_haber.total.to_s)

        rescue => e
#         apila el error (mostrando cual es) y continua
          errors.add(:base, "Error de calculo Haber #{detalle_recibo_haber.remunerative_concept.codigo}: #{prepare_calculo_for_evaluation(detalle_recibo_haber.remunerative_concept.calculo_valor)}\n#{e.message}")
        next
      end
      if detalle_recibo_haber.remunerative_concept.calculo_cantidad.present?
#         controla error
        begin
          detalle_recibo_haber.update_attributes(:cantidad_recibo => detalle_recibo_haber.instance_eval(prepare_calculo_for_evaluation(detalle_recibo_haber.remunerative_concept.calculo_cantidad)))
          rescue => e
#           apila el error (mostrando cual es) y continua
          errors.add(:base, "Error de calculo Haber #{detalle_recibo_haber.remunerative_concept.codigo}: #{prepare_calculo_for_evaluation(detalle_recibo_haber.remunerative_concept.calculo_cantidad)}\n#{e.message}")
          next
        end
      end

#     acumula en cada uno de los acumuladores de remunerative_concepts.acumuladores el split separa por palabra el default de separador es ' '
      detalle_recibo_haber.remunerative_concept.acumuladores_valor.split(' ').each do |acumulador|
        acumulador.gsub!('@', '') # el ! en el gsub es lo mismo que "acumulador = acumulador.gsub('@', '')"
#       acumula total, para eso arma con send la posicion donde debe acumular(el si el acumulador contiene sueldo_basico,
#       al ejecutarse el send aacumularia en acumuladores.sueldo_basico
        self.acumuladores.send("#{acumulador}=", self.acumuladores.send(acumulador).to_f + detalle_recibo_haber.total.to_f)
      end
#      detalle_recibo_haber.remunerative_concept.acumuladores_cantidad_valor.split(' ').each do |acumulador|
#        acumulador.gsub!('@', '') # el ! en el gsub es lo mismo que "acumulador = acumulador.gsub('@', '')"
#        self.acumuladores.send("#{acumulador}=", self.acumuladores.send(acumulador).to_f + detalle_recibo_haber.cantidad.to_f)
#      end
    end
    detalle_recibo_retencions.joins(:retention_concept).order("retention_concepts.prioridad").each do |detalle_recibo_retencion|
#      controla error
      begin
#       actualiza la propiedad total de detelle_recibo_haber conel resultado de la evaluacion de la transformacion del calculo
        detalle_recibo_retencion.update_attributes(:total => detalle_recibo_retencion.instance_eval(prepare_calculo_for_evaluation(detalle_recibo_retencion.retention_concept.formula_calculo_valor)))
      rescue => e
#       apila el error (mostrando cual es) y continua
        errors.add(:base, "Error de calculo Retencion: #{prepare_calculo_for_evaluation(detalle_recibo_retencion.retention_concept.formula_calculo_valor)}\n#{e.message}")
        next
      end
      detalle_recibo_retencion.retention_concept.acumuladores_valor.split(' ').each do |acumulador|
        acumulador.gsub!('@', '') # el ! en el gsub es lo mismo que "acumulador = acumulador.gsub('@', '')"
        self.acumuladores.send("#{acumulador}=", self.acumuladores.send(acumulador).to_f + detalle_recibo_retencion.total.to_f)
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
#
    detalle_recibo_haber_adicionados = self.employee.employee_remunerative_concepts.map do |rc|
      detalle_recibo_habers.build(:remunerative_concept_id => rc.remunerative_concept_id, :cost_center_id => rc.cost_center_id)
    end

    self.employee.employee_retention_concepts.each do |rc|
      detalle_recibo_retencions.build(:retention_concept_id => rc.retention_concept_id, :cost_center_id => employee.cost_center_id)
    end

    detalle_recibo_haber_adicionados.each do |rc|
      if rc.remunerative_concept.concepto_asociado_haber_id.present?
        detalle_recibo_habers.build(:remunerative_concept_id => rc.remunerative_concept.concepto_asociado_haber_id, :cost_center_id => employee.cost_center_id)
      end
      if rc.remunerative_concept.concepto_asociado_haber_2_id.present?
        detalle_recibo_habers.build(:remunerative_concept_id => rc.remunerative_concept.concepto_asociado_haber_2_id, :cost_center_id => employee.cost_center_id)
      end
    end
#
  end

  def carga_codigo_predefinido_update
    detalle_recibo_habers.dup.each do |drh|
      if drh.new_record? && drh.remunerative_concept.concepto_asociado_haber_id.present?
          detalle_recibo_habers.build(:remunerative_concept_id => drh.remunerative_concept.concepto_asociado_haber_id, :cost_center_id => employee.cost_center_id)
      end
    end
  end

  def total_haberes
      detalle_recibo_habers.all.sum(&:total)
  end

  def total_haberes_con_descuento
    total = 0
    detalle_recibo_habers.each do |drh|
      if drh.remunerative_concept.acumuladores_valor.include?("@haberescondescuento")
        total += drh.total
      end
    end
    return total
  end

# reescrive el metodo method_missing que se ejecuta cuando no encuentra un metodo
# si existe en employee ese metodo lo retorna, caso contrario continua con el default del method_missing
  def method_missing(method, *args, &block)
    if employee.attribute_names.reject{|attr| attr =~ /^id$/}.include?(method.to_s)
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
      anos = pl.year.to_i - fi.year.to_i + employee.antiguedad_reconocida_anos.to_i
      anos = anos - 1 if fi.month >  pl.month + employee.antiguedad_reconocida_meses.to_i
      return anos
  end

  def calculo_edad(fnac, fhoy)
    (fhoy.year - fnac.year) - (fhoy.yday < fnac.yday ? 1 : 0)
  end

  def calculo_dias_trabajados_semestre(pl, ingreso , egreso)
      if pl.month < 7
        finicio = (pl.year.to_s+"-01-01").to_date
      else
        finicio = (pl.year.to_s+"-07-01").to_date
      end
      ffinal  = Date.new(pl.year, pl.month, -1)
      if !egreso.nil?
        if (egreso.to_date > finicio.to_date) &&  (egreso.to_date < ffinal.to_date)
          ffinal=egreso
        end
      else
        egreso= pl.end_of_month
      end
      if ingreso > finicio
        finicio= ingreso
      end
#errors.add(:base, "ingreso "+ingreso.to_s+" Egreso "+egreso.to_s)
      if (ingreso.year.to_i * 100) + ingreso.month.to_i > (pl.year * 100 + pl.month) ||
          (egreso.year.to_i * 100) + egreso.month.to_i  < (pl.year * 100 + pl.month)
         diastrabajados = 0
      else
        diastrabajados = ( (ffinal.month - finicio.month) * 30) + ffinal.day
      end
      return diastrabajados
  end

  def mejor_remuneracion_semestre
    if self.liquidacion.periodo.month < 7
      dpl =Date.new(self.liquidacion.periodo.year,1,1)
    else
      dpl = Date.new(self.liquidacion.periodo.year,1,7)
    end
#   ntotal = DetalleReciboHaber.group(:recibo_sueldo_id).joins(:remunerative_concept).where(['remunerative_concepts.acumuladores_valor like ?', "%@haberescondescuento%"]).sum(:total)
#    ntotal = DetalleReciboHaber.joins(:recibo_sueldo).group("recibo_sueldos.employee_id").joins(:remunerative_concept).where(['remunerative_concepts.acumuladores_valor like ? ', "%@haberescondescuento%"]).sum(:total)
#    ntotal = DetalleReciboHaber.joins(:recibo_sueldo).group(:recibo_sueldos =>{:employee_id}).joins(:remunerative_concept).where(['remunerative_concepts.acumuladores_valor like ? ', "%@haberescondescuento%"]).sum(:total)
    ntotal = DetalleReciboHaber.joins([:remunerative_concept, :recibo_sueldo => :liquidacion])
              .group("recibo_sueldos.liquidacion_id")
              .where(:recibo_sueldos => {:employee_id => employee_id})
              .where(:liquidacions => {:periodo => dpl..liquidacion.periodo})
              .where('remunerative_concepts.acumuladores_valor like ?',"%@aguinaldo%").sum(:total)
#    .where(:liquidacions => {:periodo.month => dpl..liquidacion.periodo.month})
#    .where(:liquidacions => {:periodo.year => liquidacion.periodo.year})

#       errors.add(:base, "paso "+ntotal.map{|g| g.last.to_f}.max.to_s)
    return ntotal.map{|g| g.last.to_f}.max
  end

  def mejor_remuneracion_habitual_semestre
    if self.liquidacion.periodo.month < 7
      dpl =Date.new(self.liquidacion.periodo.year,1,1)
    else
      dpl = Date.new(self.liquidacion.periodo.year,1,7)
    end
    ntotal = DetalleReciboHaber.joins([:remunerative_concept, :recibo_sueldo => :liquidacion])
              .group("recibo_sueldos.liquidacion_id")
              .where(:recibo_sueldos => {:employee_id => employee_id})
              .where(:liquidacions => {:periodo => dpl..liquidacion.periodo})
              .where('remunerative_concepts.acumuladores_valor like ?',"%@remuneracion_habitual%").sum(:total)
#    .where(:liquidacions => {:periodo.month => dpl..liquidacion.periodo.month})
#    .where(:liquidacions => {:periodo.year => liquidacion.periodo.year})
#       errors.add(:base, "paso "+ntotal.map{|g| g.last.to_f}.max.to_s)
    return ntotal.map{|g| g.last.to_f}.max
  end

  def calculo_dias_vacaciones(fi, pl)
    anos = calculo_antiguedad(fi, pl)
    dias_vacaciones = 0

    if anos < 1
      dias_vacaciones = ( ( ( (pl.year.to_s+'-'+pl.month.to_s+"-01").to_date - fi) +
                                (employee.antiguedad_reconocida_meses * 30) ) / 20).to_i
#errors.add(:base, "< anios "+dias_vacaciones.to_s)
    else
      case anos
        when 1..9
          dias_vacaciones = 14 +  7 if anos > 5
        when 10..19
          dias_vacaciones = 28
        else
          dias_vacaciones = 35
      end
    end
    if dias_vacaciones < 0
       dias_vacaciones = 0
    end
    return dias_vacaciones
  end

  def calculo_cantidad_sueldos_indemnizacion_despido(fi, pl)
    anos = calculo_antiguedad(fi, pl)
    if pl.month - fi.month > 3
      anos = anos + 1
    end
    return anos
  end

  def calculo_mejor_remuneracion_habitual_anual

    ntotal = DetalleReciboHaber.joins([:remunerative_concept, :recibo_sueldo => :liquidacion])
              .group("recibo_sueldos.liquidacion_id")
              .where(:recibo_sueldos => {:employee_id => employee_id})
              .where(:liquidacions => {:periodo => liquidacion.periodo.beginning_of_year..liquidacion.periodo.end_of_year})
              .where('remunerative_concepts.acumuladores_valor like ?',"%@remuneracion_habitual%").sum(:total)
#       errors.add(:base, "paso "+ntotal.map{|g| g.last.to_f}.max.to_s)
    return ntotal.map{|g| g.last.to_f}.max
  end

  def calculo_cantidad_indemnizacion_falta_preaviso
    if employee.fecha_egreso.present?
      if self.acumuladores.antiguedad < 5
        cantidad = 1
      else
        cantidad = 2
      end
    else
      cantidad = 0
    end
    return cantidad
  end

  def calculo_dias_trabajados_mes(fi,fe)
     if fe.nil?
       fe=fi.end_of_month()
     end
     if fi.year == fe.year && fi.month == fe.month
       cantidad = fe.day - fi.month
     else
       cantidad = fe.day
     end
     if cantidad > 30
       cantidad = 30
     end
     return cantidad
  end

  def calculo_dias_vacaciones_no_gozadas(fi,fe,pl)
    if fe.nil?
      fe=fi.end_of_month()
    end
    if fi.year < pl.year
      fi =(pl.year.to_s + "01-01").to_date
    end
    cantidad = (fe.month - fi.month)
    cantidad = cantidad * 30 + fe.day
    cantidad = (self.acumuladores.dias_vacaciones.to_f / 360) * cantidad
    return cantidad
  end



end
