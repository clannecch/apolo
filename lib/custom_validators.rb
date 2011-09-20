class RemunerativeConceptsDataToAskValidator < ActiveModel::Validator
  def validate(record)
    @options[:campos].each do |campo|
      record.errors.add(campo, "Debe Indicar #{campo.capitalize} en Haber") if record.remunerative_concept.data_to_ask.send("#{campo}?") && record.send(campo).to_i.zero?
      record.errors.add(campo, "No debe indicar #{campo.capitalize} en Haber" ) if !record.remunerative_concept.data_to_ask.send("#{campo}?") && record.send(campo).present?
    end
  end
end

class RetentionConceptsDataToAskValidator < ActiveModel::Validator
 def validate(record)
   @options[:campos].each do |campo|
     record.errors.add(campo, "Debe Indicar #{campo.capitalize} en Retencion")    if record.retention_concept.data_to_ask.send("#{campo}?") && record.send(campo).to_i.zero?
     record.errors.add(campo, "No debe indicar #{campo.capitalize} en Retencion") if !record.retention_concept.data_to_ask.send("#{campo}?") && record.send(campo).present?
   end
 end
end

