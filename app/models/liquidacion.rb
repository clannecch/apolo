class Liquidacion < ActiveRecord::Base
  has_many :recibo_sueldos
  belongs_to :tipo_recibo

  validates_numericality_of 	:quincena, :greater_than => 0, :less_than =>  3,  :message => "valores posibles 1 o 2"
  validates_length_of         :periodo, :is => 7,                               :message => "debe ingresar como AAAA-MM"
  validates_length_of         :periodo_deposito , :is => 7,                     :message => "debe ingresar como AAAA-MM"
  validate                    :check_periodo

	validates_presence_of		    :periodo,															            :message => "es un dato requerido"
  validates_presence_of		    :quincena,															          :message => "es un dato requerido"
  validates_presence_of		    :fecha_liquidacion,															  :message => "es un dato requerido"
  validates_presence_of		    :fecha_deposito,															    :message => "es un dato requerido"
  validates_presence_of		    :periodo_deposito,											          :message => "es un dato requerido"


  private
  def check_periodo
    if :periodo[0..3].to_i > 2010
       errors.add(:periodo, "el Ano debe ser mayor a 2011")
    end
#    if (1..12).include?(periodo[-2..-1].to_i)
    unless (1..12).include?(periodo[5..6].to_i)
       errors.add(:periodo, "el Mes debe estar comprendido entre 01 y 12")
    end
    if :periodo[0..3].to_i > 2010
       errors.add(:periodo_deposito, 'el Ano del debe ser mayor a 2011')
    end
    unless (1..12).include?(periodo[-2..-1].to_i)
       errors.add(:periodo_deposito, "el Mes debe estar comprendido entre 01 y 12")
    end
  end

  def full_period
#    apellido + ', '+nombre
   [periodo, quincena].compact.join(' Quincena ')
  end

end
