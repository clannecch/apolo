class AddFechaCalculoToReciboSueldo < ActiveRecord::Migration
  def self.up
    add_column :recibo_sueldos, :fecha_calculo, :datetime
  end

  def self.down
    remove_column :recibo_sueldos, :fecha_calculo
  end
end
