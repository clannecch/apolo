class RemunerativeConcept < ActiveRecord::Base
  belongs_to :concepto_asociado_haber, :class_name => "RemunerativeConcept"
  belongs_to :concepto_asociado_retencion, :class_name => "RetentionConcept"
  belongs_to :concepto_asociado_haber_2, :class_name => "RemunerativeConcept"
  belongs_to :concepto_asociado_retencion_2, :class_name => "RetentionConcept"
  #has_many :group_remuneration_relations
  has_and_belongs_to_many :group_remunerations
  validate :cannot_asociate_iqual_concept
  validates_presence_of :detalle, :codigo, :calculation_type, :valor

  def cannot_asociate_iqual_concept
    if (self.concepto_asociado_haber_id == self.concepto_asociado_haber_2_id) && !self.concepto_asociado_haber_id.nil?
      errors.add(:base, 'No puede asociar 2 veces el mismo haber')
    end
  end

  def all_without_myself
    (new_record?) ? RemunerativeConcept.all : (RemunerativeConcept.all - [self])
  end
end


=begin

belongs_to :author

obj.author

asumo que
- guardaste en RemunerativeConcept campo author_id el numero de referencia
- El objeto en cuestion sera Autor.find(el numero de referencia almacenado)


belongs_to :author, :class_name => "Person"

obj.author

asumo que
- guardaste en RemunerativeConcept campo author_id el numero de referencia
- El objeto en cuestion sera Person.find(el numero de referencia almacenado)



belongs_to :author, :class_name => "Person", :foreign_key => "REF_PERSONA_ASOCIADA_ID"

obj.author

asumo que
- guardaste en RemunerativeConcept campo REF_PERSONA_ASOCIADA_ID el numero de referencia
- El objeto en cuestion sera Person.find(el numero de referencia almacenado)


has_many :authors, :class_name => "Person"#, :foreign_key => "remunerative_concept_id"

=end
