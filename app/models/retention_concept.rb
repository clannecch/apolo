class RetentionConcept < ActiveRecord::Base
  has_and_belongs_to_many :group_retentions
  validates_presence_of		    :detalle,															                          :message => "es un dato requerido"
end
