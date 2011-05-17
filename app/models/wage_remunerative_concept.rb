class WageRemunerativeConcept < ActiveRecord::Base
  [:concepto_asociado_haber,
  :concepto_asociado_retencion,
  :concepto_asociado_haber_2,
  :concepto_asociado_retencion_2
  ].each {|field| belongs_to field, :class_name => "WageRemunerativeConcept"}

  def all_without_me
    all - [self]
    #(new_record?)? all : where("id != #{self.id}")
  end
end
