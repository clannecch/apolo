# == Schema Information
# Schema version: 20110721162735
#
# Table name: categories
#
#  id         :integer         not null, primary key
#  detalle    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  importe    :decimal(, )
#  company_id :integer
#

class Category < ActiveRecord::Base
	has_many :employees, :dependent => :restrict
  validates_presence_of		    :detalle,															              :message => "es un dato requerido"

  scope :by_company, lambda {|company| where(:company_id => company) }

  before_save :controlar_cambios

  @Recalcular = false

  def controlar_cambios
    @Recalcular = ( importe         != importe_was          ) ||
                  ( horas           != horas_was       )
    return true
  end

  def cambio_algo
    if @Recalcular
      total = 0
#      Liquidacion.where(:fecha_cierre.nil?).each do |l|
#        total += ReciboSueldo.joins(:employees).where(:liquidacion_id => l.id).where("employees.remuneracion_fuera_convenio" => 0 || "employees.horas_pactadas" => 0).count
#      end
      Liquidacion.where(:fecha_cierre.nil?).each do |liq|
        liq.recibo_sueldos.each do |rec|
          if rec.employee.category_id == self.id && (rec.employee.remuneracion_fuera_convenio == 0 || rec.employee.horas_pactadas == 0)
            total += 1
          end
        end
      end
      if total < 1
        @Recalcular = false
      end
    end
    return @Recalcular
  end

  def calculate_changes
    Liquidacion.where(:fecha_cierre.nil?).each do |liq|
      liq.recibo_sueldos.each do |rec|
        if rec.employee.category_id == self.id && (rec.employee.remuneracion_fuera_convenio == 0 || rec.employee.horas_pactadas == 0)
          rec.calcular_recibo
        end
      end
#      ReciboSueldo.joins(:employees).where(:liquidacion_id => liq.id).where( "employees.remuneracion_fuera_convenio" => 0 || "employees.horas_pactadas" => 0 && "employees.category_id" => @category.id ).each do |r|
    end
=begin
      Liquidacion.where(:fecha_cierre.nil?).each do |l|
        ReciboSueldo.joins(:employees).where(:liquidacion_id => l.id).where("employees.remuneracion_fuera_convenio" => 0 || "employees.horas_pactadas" => 0).each do |r|
          Rails.logger.info("Recibo: "+r.employee.legajo+" - "+r.employee.full_name)
          r.calcular_recibo
        end
      end
=end
  end


 # def print
 #   require 'prawn'
 #   pdf = Prawn::Document.new
 #   pdf.text("Prawn Rocks")
 #   pdf.render_file('prawn.pdf')
  #  end
end

