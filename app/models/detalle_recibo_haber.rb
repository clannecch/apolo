# == Schema Information
# Schema version: 20110621182933
#
# Table name: detalle_recibo_habers
#
#  id                      :integer         not null, primary key
#  recibo_sueldo_id        :integer
#  remunerative_concept_id :integer
#  detalle                 :string(255)
#  cost_center_id          :integer
#  cantidad                :decimal(, )
#  importe                 :decimal(, )
#  total                   :decimal(, )
#  created_at              :datetime
#  updated_at              :datetime
#

class DetalleReciboHaber < ActiveRecord::Base
# has_many   :remunerative_concepts
  belongs_to :remunerative_concept
  belongs_to :recibo_sueldo

# indica que acumuladores y employee los tome de  :recibo_sueldo
  delegate :employee, :to => :recibo_sueldo
  # hace esto

  def acumuladores
    ReciboSueldo.acumuladores
  end

  validates_presence_of     :remunerative_concept_id
  validates_uniqueness_of   :remunerative_concept_id, :scope => [:cost_center_id, :recibo_sueldo_id]
  validates_numericality_of :cantidad, :if => :cantidad?
  validates_numericality_of :importe, :allow_blank => true
  validate :validate_remunerative_concepts_data_to_ask


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
  def validate_remunerative_concepts_data_to_ask

    errors.add(:cantidad, "Debe Indicar cantidad en Haber") if remunerative_concept.data_to_ask.cantidad? && cantidad.to_i.zero?
    errors.add(:importe,  "Debe Indicar importe en Haber" ) if remunerative_concept.data_to_ask.importe? && importe.to_i.zero?

    errors.add(:cantidad,  "No debe indicar cantidad en Haber" ) if !remunerative_concept.data_to_ask.cantidad? && cantidad.present?
    errors.add(:importe,  "No debe indicar importe en Haber" ) if !remunerative_concept.data_to_ask.importe? && importe.present?

#    errors.add(:cantidad, "No debe informar cantidad en Haber") unless remunerative_concept.data_to_ask.cantidad? && cantidad.blank?

#    case remunerative_concept.data_to_ask_id
#      when 1
#        importe.blank? && cantidad?
#        errors.add(:importe, "importe no puede estar lleno")
#      when 2
#        cantidad.blank? && importe?
#        errors.add(:cantidad, "cantidad no puede estar lleno")
#      else
#        errors.add(:cantidad, "cantidad debe estar lleno") if cantidad.blank? || cantidad.zero?
#        errors.add(:importe, "importe debe estar lleno") if importe.blank? || importe.zero?
#   end





  end
end
