class ReciboSueldo < ActiveRecord::Base
  belongs_to              :employee
  belongs_to              :liquidacion

  #has_many                :detalle_recibo

  validates_presence_of		:employee_id ,	:message => "es un dato requerido"
  validates_uniqueness_of :employee_id ,  :message => "existe liquidacion activa"

  has_many                :detalle_recibo_habers
  accepts_nested_attributes_for :detalle_recibo_habers, :allow_destroy => true

  has_many                :detalle_recibo_retencions
  accepts_nested_attributes_for :detalle_recibo_retencions, :allow_destroy => true

  after_validation        :carga_codigo_predefinido_create, :on => :create, :if => :employee_id?
  after_validation        :carga_codigo_predefinido_update, :on => :update, :if => :employee_id?

  attr_accessor_with_default :acumuladores, OpenStruct.new
#=begin


  # ":cantidad * @basico"
  # "self.cantidad * acumuladores.basico"
  def calcular_recibo
#    ejecuta una select sobre recibo_habers haciendo un join con remunerative concepts para traer prioridad de calculo
#    toma cada elemento del array y lo deja en detalle_recibo_haber y lo ordena por prioridad
    detalle_recibo_habers.join(:remunerative_concept).order("remunerative_concepts.prioridad").each do |detalle_recibo_haber|
#      controla error
      begin
#       actualiza la propiedad total de detelle_recibo_haber conel resultado de la evaluacion de la transformacion del calculo
        detalle_recibo_haber.total = instance_eval(prepare_calculo_for_evaluation(detalle_recibo_haber.remunerative_concept.calculo))
      rescue => e
#       apila el error (mostrando cual es) y continua
        errors.add(:base, "Error de calculo: #{e.message}")
        next
      end
#     acumula en cada uno de los acumuladores de remunerative_concepts.acumuladores el split separa por palabra el default de separador es ' '
      detalle_recibo_haber.remunerative_concept.acumuladores.split(' ').each do |acumulador|
#       acumula total, para eso arma con send la posicion donde debe acumular(el si el acumulador contiene sueldo_basico,
#       al ejecutarse el send aacumularia en acumuladores.sueldo_basico
        acumuladores.send("#{acumulador}=", detalle_recibo_haber.total)
      end
    end

  end

  private

  #reemplaza del parametro los : por el nombre del modelo y el @ por el nombre de la colecicon de acumuladores
  def prepare_calculo_for_evaluation(str_for_evaluation)
    str_for_evaluation.gsub(/\:/,'self.').gsub(/@/, 'acumuladores.')
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
    self.detalle_recibo_habers.dup.each do |drh|
      if drh.new_record? && drh.remunerative_concept.concepto_asociado_haber_id.present?
          detalle_recibo_habers.build(:remunerative_concept_id => drh.remunerative_concept.concepto_asociado_haber_id, :cost_center_id => employee.cost_center_id)
      end
    end
  end

end
