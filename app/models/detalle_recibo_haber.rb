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

require 'custom_validators'

class DetalleReciboHaber < ActiveRecord::Base
# has_many   :remunerative_concepts
  belongs_to :remunerative_concept
  belongs_to :recibo_sueldo

# indica que acumuladores y employee los tome de  :recibo_sueldo
  delegate :employee, :to => :recibo_sueldo
  # hace esto

  include MultiplicacionPorOcho

  def acumuladores
    ReciboSueldo.acumuladores
  end

  validates_presence_of     :remunerative_concept_id
  validates_uniqueness_of   :remunerative_concept_id, :scope => [:cost_center_id, :recibo_sueldo_id]
  validates_numericality_of :cantidad, :if => :cantidad?
  validates_numericality_of :importe, :allow_blank => true
  validates_with RemunerativeConceptsDataToAskValidator, :campos => [:cantidad, :importe], :if => :remunerative_concept_id?


# reescrive el metodo method_missing que se ejecuta cuando no encuentra un metodo
# si existe en employee ese metodo lo retorna, caso contrario continua con el default del method_missing
  def method_missing(method, *args, &block)
    if employee.attribute_names.reject{|attr| attr =~ /^id$/}.include?(method.to_s)
      employee.send(method, *args, &block)
    else
      super
    end
  end
end
