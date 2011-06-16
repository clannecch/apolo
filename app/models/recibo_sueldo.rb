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
#=begin
  private

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
