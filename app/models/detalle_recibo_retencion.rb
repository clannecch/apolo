# == Schema Information
# Schema version: 20110621182933
#
# Table name: detalle_recibo_retencions
#
#  id                   :integer         not null, primary key
#  recibo_sueldo_id     :integer
#  retention_concept_id :integer
#  detalle              :string(255)
#  cost_center_id       :integer
#  cantidad             :decimal(, )
#  importe              :decimal(, )
#  total                :decimal(, )
#  created_at           :datetime
#  updated_at           :datetime
#

class DetalleReciboRetencion < ActiveRecord::Base
  belongs_to :retention_concept
  belongs_to :recibo_sueldo

  delegate :acumuladores, :to => :recibo_sueldo

  validates_presence_of :retention_concept_id
#  validates_numericality_of :cantidad, :if => :cantidad?
  validates_numericality_of :cantidad, :allow_blank => true
  validates_numericality_of :importe, :allow_blank => true
  validate :validate_retention_concepts_data_to_ask

  private
  def validate_retention_concepts_data_to_ask

    errors.add(:cantidad, "Debe Indicar cantidad en Retencion") if retention_concept.data_to_ask.cantidad? && cantidad.to_i.zero?
    errors.add(:importe,  "Debe Indicar importe en Retencion" ) if retention_concept.data_to_ask.importe? && importe.to_i.zero?

    errors.add(:cantidad,  "No debe indicar cantidad en Retencion" ) if !retention_concept.data_to_ask.cantidad? && cantidad.present?
    errors.add(:importe,  "No debe indicar importe en Retencion" ) if !retention_concept.data_to_ask.importe? && importe.present?

  end


end
