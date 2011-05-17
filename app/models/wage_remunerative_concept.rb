class WageRemunerativeConcept < ActiveRecord::Base
  belongs_to :concepto_asociado_haber
  belongs_to :concepto_asociado_retencion
  belongs_to :concepto_asociado_haber_2
  belongs_to :concepto_asociado_retencion_2
end
