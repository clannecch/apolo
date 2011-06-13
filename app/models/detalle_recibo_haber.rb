class DetalleReciboHaber < ActiveRecord::Base
  belongs_to :remunerative_concept
  belongs_to :recibo_sueldo

  validates_presence_of :remunerative_concept_id
  validates_uniqueness_of :remunerative_concept_id, :scope => [:cost_center_id, :recibo_sueldo_id]
  validate :validate_remunerative_concepts_data_to_ask

  private

  def validate_remunerative_concepts_data_to_ask
    case remunerative_concept.data_to_ask_id
      when 1
        importe.blank? && cantidad?
        errors.add(:importe, "importe no puede estar lleno")
      when 2
        cantidad.blank? && importe?
        errors.add(:cantidad, "cantidad no puede estar lleno")
      else
        errors.add(:cantidad, "cantidad debe estar lleno") if cantidad.blank? || cantidad.zero?
        errors.add(:importe, "importe debe estar lleno") if importe.blank? || importe.zero?
    end
  end
end
