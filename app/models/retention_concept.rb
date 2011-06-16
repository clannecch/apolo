class RetentionConcept < ActiveRecord::Base
  has_and_belongs_to_many :group_retentions
  belongs_to :data_to_ask
  validates_presence_of		    :detalle,	:acumuladores_valor, :formula_calculo_valor	, :message => "es un dato requerido"
end
