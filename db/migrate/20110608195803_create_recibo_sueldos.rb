class CreateReciboSueldos < ActiveRecord::Migration
  def self.up
    create_table :recibo_sueldos do |t|
      t.integer :liquidacion_id
      t.integer :employee_id
      t.date :fecha_recibo
      t.string :observaciones
      t.string :mensaje_recibo

      t.timestamps
    end
  end

  def self.down
    drop_table :recibo_sueldos
  end
end
