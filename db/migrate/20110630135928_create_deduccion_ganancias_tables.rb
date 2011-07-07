class CreateDeduccionGananciasTables < ActiveRecord::Migration
  def self.up
    create_table :deduccion_ganancias_tables do |t|
      t.string :periodo
      t.float :no_imponibles
      t.float :conyuge
      t.float :hijo
      t.float :otras
      t.float :especial_inciso_e
      t.float :especial_inciso_abc

      t.timestamps
    end
  end

  def self.down
    drop_table :deduccion_ganancias_tables
  end
end
