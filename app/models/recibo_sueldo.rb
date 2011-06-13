class ReciboSueldo < ActiveRecord::Base
  belongs_to              :employee
  belongs_to              :liquidacion

  #has_many                :detalle_recibo, :as => :detallable

  validates_presence_of		:employee_id ,	:message => "es un dato requerido"
  validates_uniqueness_of :employee_id ,  :Message => "existe liquidacion activa"

  has_many                :detalle_recibo_habers
  accepts_nested_attributes_for :detalle_recibo_habers, :allow_destroy => true

  has_many                :detalle_recibo_retencions
  accepts_nested_attributes_for :detalle_recibo_retencions, :allow_destroy => true

  after_validation        :carga_codigo_predefinido, :on => :create
#=begin
  private

  def carga_codigo_predefinido

      self.employee.group_remuneration.remunerative_concepts.each do |rc|
        dhr = self.detalle_recibo_habers.build()
        dhr.remunerative_concept_id = rc.id
        dhr.detalle                 = rc.detalle
        dhr.cantidad                = 1
        dhr.cost_center_id          = employee.cost_center_id
      end

      self.employee.group_retention.retention_concepts do |rc|
        dhr = self.detalle_recibo_habers.build()
        dhr.remunerative_concept_id = rc.id
        dhr.detalle                 = rc.detalle
        dhr.cantidad                = 1
        dhr.cost_center_id          = employee.cost_center_id
      end

  end
#=end
end
