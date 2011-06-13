class DetalleReciboRetencion < ActiveRecord::Base
  belongs_to :retention_concepts
  belongs_to :recibo_sueldo

  validates_presence_of :retention_concept_id
end
