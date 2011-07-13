# == Schema Information
# Schema version: 20110706162424
#
# Table name: liquidacions
#
#  id                :integer         not null, primary key
#  fecha_liquidacion :date
#  fecha_deposito    :date
#  bank_deposit_id   :integer
#  fecha_cierre      :date
#  quincena          :integer
#  techo_retenciones :decimal(, )
#  created_at        :datetime
#  updated_at        :datetime
#  tipo_recibo_id    :integer
#  periodo           :date
#  periodo_deposito  :date
#

class Liquidacion < ActiveRecord::Base
  scope :by_company, lambda {|company| where(:company_id => company) }
  has_many :recibo_sueldos
  belongs_to :tipo_recibo
  belongs_to :bank_deposit

  validates_uniqueness_of     :periodo,
                              :scope => [:quincena, :tipo_recibo_id],            :message => "+quincena+tipo recibo duplicado"

  validates_inclusion_of 	    :quincena, :in => 1..2,                           :message => "valores posibles 1 o 2"

	validates_presence_of		    :periodo, :quincena,
                              :fecha_liquidacion,															  :message => "es un dato requerido"
  validates_presence_of		    :fecha_deposito,
                              :if => :periodo_deposito?,					          :message => "es un dato requerido"

  default_scope order('periodo ASC') 

#  validate                    :check_periodo

  private
#  def check_periodo
#    if :periodo[0..3].to_i > 2010
#       errors.add(:periodo, "el Ano debe ser mayor a 2011")
#    end
##    if (1..12).include?(periodo[-2..-1].to_i)
#    unless (1..12).include?(periodo[5..6].to_i)
#       errors.add(:periodo, "el Mes debe estar comprendido entre 01 y 12")
#    end
#    if :periodo[0..3].to_i > 2010
#       errors.add(:periodo_deposito, 'el Ano del debe ser mayor a 2011')
#    end
#    unless (1..12).include?(periodo[-2..-1].to_i)
#       errors.add(:periodo_deposito, "el Mes debe estar comprendido entre 01 y 12")
#    end
#  end

  def full_period
#    apellido + ', '+nombre
   [(periodo.ano.to_s +'/'+ periodo_mes.to_s), quincena].compact.join(' Quincena ')
  end

end
